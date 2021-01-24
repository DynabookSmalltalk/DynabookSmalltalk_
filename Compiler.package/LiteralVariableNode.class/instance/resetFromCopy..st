code generation
resetFromCopy: aLiteralVariableNode
	"Reset the state of the recever to match that of the argument.
	 This is used to reset nodes that may have been repurposed
	 while generatig the compiled method for a full block."

	self assert: (readNode == (aLiteralVariableNode instVarNamed: 'readNode')
				and: [writeNode == (aLiteralVariableNode instVarNamed: 'writeNode')]).
	super resetFromCopy: aLiteralVariableNode