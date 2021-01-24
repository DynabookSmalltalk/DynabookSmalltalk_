instruction decoding
pushFullClosure: aCompiledBlock numCopied: numCopied
	"Create a BlockClosure corresponding to the closure bytecode
	 and execute the action block with it. The created BlockClosure is only a pseudo value,
	 it is not populated with meaningful context and argument information."
	self pushFullClosure: aCompiledBlock numCopied: numCopied receiverOnStack: false ignoreOuterContext: false