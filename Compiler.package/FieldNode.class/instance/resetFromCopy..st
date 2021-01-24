code generation
resetFromCopy: aFieldNode
	"Reset the state of the recever to match that of the argument.
	 This is used to reset nodes that may have been repurposed
	 while generatig the compiled method for a full block."

	self assert: (fieldDef == aFieldNode fieldDef
				and: [rcvrNode == (aFieldNode instVarNamed: 'rcvrNode')
				and: [readNode == (aFieldNode instVarNamed: 'readNode')
				and: [writeNode == (aFieldNode instVarNamed: 'writeNode')]]]).
	super resetFromCopy: aFieldNode