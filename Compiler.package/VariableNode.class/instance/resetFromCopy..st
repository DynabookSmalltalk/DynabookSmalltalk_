code generation
resetFromCopy: aVariableNode
	"Reset the state of the recever to match that of the argument.
	 This is used to reset nodes that may have been repurposed
	 while generatig the compiled method for a full block."

	self assert: name == aVariableNode name.
	super resetFromCopy: aVariableNode