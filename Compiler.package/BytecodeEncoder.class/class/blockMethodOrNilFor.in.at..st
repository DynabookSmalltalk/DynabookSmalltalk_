instruction stream support
blockMethodOrNilFor: anInstructionStream in: method at: pc
	"If anInstructionStream is at a block creation bytecode then answer the block's
	 CompiledBlock, otherwise answer nil.
	 Subclasses override as appropriate."

	^nil