code generation
resetFromCopy: aLeafNode
	"Reset the state of the recever to match that of the argument.
	 This is used to reset nodes that may have been repurposed
	 while generatig the compiled method for a full block."

	self assert: key == aLeafNode key.
	code := aLeafNode code.
	index := aLeafNode index