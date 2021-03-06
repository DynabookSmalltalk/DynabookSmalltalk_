i/o
comeFullyUpOnReload: smartRefStream
	"Internalize myself into a fully alive object after raw loading from a DataStream. (See my class comment.)  DataStream will substitute the object from this eval for the DiskProxy."
	| globalObj symbol pr nn arrayIndex env |

	symbol := globalObjectName.
	"See if class is mapped to another name"
	(smartRefStream respondsTo: #renamed) ifTrue:
		[| maybeReadDataFromContext maybeReadArrayContext |
		"Ugh; so ugly and brittle.  If there were pragmas in the relevant methods we could search, etc. eem 7/3/2017 15:54"
		maybeReadArrayContext := thisContext sender sender sender sender.
		maybeReadDataFromContext := maybeReadArrayContext sender sender sender sender.
		"If in outPointers in an ImageSegment, remember original class name.  
		 See mapClass:installIn:.  Would be lost otherwise." "Anyone know where mapClass:installIn: is/was? eem 7/3/2017 15:55"
		(maybeReadDataFromContext method selector == #readDataFrom:size:
		 and: [maybeReadDataFromContext receiver class == NativeImageSegment
		 and: [maybeReadArrayContext method == (DataStream compiledMethodAt: #readArray)]]) ifTrue:
			[arrayIndex := maybeReadArrayContext tempAt: 4.
			"index var in readArray.  Later safer to find i on stack of context."
			smartRefStream renamedConv at: arrayIndex put: symbol].	"save original name"
		symbol := smartRefStream renamed at: symbol ifAbsent: [symbol]].	"map"
	env := Environment current.
	globalObj := env valueOf: symbol ifAbsent: [
		preSelector == nil & (constructorSelector = #yourself) ifTrue: [
			Transcript cr; show: symbol, ' is undeclared.'.
			env undeclare: symbol.
			^ nil].
		^ self error: 'Global "', symbol, '" not found'].
	((symbol == #World) and: [Smalltalk isMorphic not]) ifTrue: [
		self inform: 'These objects will work better if opened in a Morphic World.
Dismiss and reopen all menus.'].

	preSelector ifNotNil: [
		Symbol hasInterned: preSelector ifTrue: [:selector |
			[globalObj := globalObj perform: selector] on: Error do: [:ex |
				ex messageText = 'key not found' ifTrue: [^ nil].
				^ ex signal]]
	].
	symbol == #Project ifTrue: [
		(constructorSelector = #fromUrl:) ifTrue: [
			nn := (constructorArgs first findTokens: '/') last.
			nn := (nn findTokens: '.|') first.
			pr := Project named: nn. 
			^ pr ifNil: [self] ifNotNil: [pr]].
		pr := globalObj perform: constructorSelector withArguments: constructorArgs.
		^ pr ifNil: [self] ifNotNil: [pr]].	"keep the Proxy if Project does not exist"

	constructorSelector ifNil: [^ globalObj].
	Symbol hasInterned: constructorSelector ifTrue: [:selector |
		[^ globalObj perform: selector withArguments: constructorArgs] on: Error do: [:ex |
			ex messageText = 'key not found' ifTrue: [^ nil].
			^ ex signal]
	].
				"args not checked against Renamed"
	^ nil 	"was not in proper form"