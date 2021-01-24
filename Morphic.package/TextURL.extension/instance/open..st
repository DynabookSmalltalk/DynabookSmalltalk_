*Morphic
open: anObject

	anObject isBehavior ifTrue: [
		^ ToolSet browseClass: anObject].
	anObject isCompiledMethod ifTrue: [
		^ ToolSet browse: anObject methodClass selector: anObject selector].
	anObject class == MethodReference ifTrue: [
		^ ToolSet browse: anObject actualClass selector: anObject selector].
	anObject isSymbol ifTrue: [
		SystemNavigation default browseAllImplementorsOf: anObject.
		SystemNavigation default browseAllCallsOn: anObject.
		self flag: #todo. "mt: Which tool window to return in this case?"
		^ self].