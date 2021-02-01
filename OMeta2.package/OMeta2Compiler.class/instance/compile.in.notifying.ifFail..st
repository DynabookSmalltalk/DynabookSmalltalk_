as yet unclassified
compile: origCode in: cls notifying: notify ifFail: failBlock

	| origCodeStream parseTree structuredCode translatedCode |
	origCodeStream := origCode asString readStream.
	self from: origCodeStream class: cls "context: nil" notifying: notify.
	[
		parseTree := OMeta2RuleParser matchStream: origCodeStream with: #rule withArgs: #() withPlaybackDebugging: false.
		parseTree := OMeta2Optimizer match: parseTree with: #optimizeRule.
		structuredCode := OMeta2RuleTranslator match: parseTree with: #translate withArgs: {cls}.
		translatedCode := OMeta2Flattener match: structuredCode with: #flatten
	] on: OM2Fail do: [
		self notify: '<-- parse error around here -->' at: origCodeStream position.
		^ failBlock value
	].
	^ Compiler new
		compile: translatedCode readStream
		in: cls
		notifying: notify
		ifFail: failBlock