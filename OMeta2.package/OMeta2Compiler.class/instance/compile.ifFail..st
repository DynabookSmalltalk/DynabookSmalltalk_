as yet unclassified
compile: cue ifFail: failBlock

	| origCodeStream parseTree structuredCode translatedCode |
	origCodeStream := cue sourceStream.
	self from: origCodeStream class: cue getClass "context: nil" notifying: cue requestor.
	[
		parseTree := OMeta2RuleParser matchStream: origCodeStream with: #rule withArgs: #() withPlaybackDebugging: false.
		parseTree := OMeta2Optimizer match: parseTree with: #optimizeRule.
		structuredCode := OMeta2RuleTranslator match: parseTree with: #translate withArgs: {cue getClass}.
		translatedCode := OMeta2Flattener match: structuredCode with: #flatten
	] on: OM2Fail do: [
		self notify: '<-- parse error around here -->' at: origCodeStream position.
		^ failBlock value
	].
cue instVarNamed: #source put: translatedCode readStream.
	^ Compiler new
		compile: cue
		ifFail: failBlock