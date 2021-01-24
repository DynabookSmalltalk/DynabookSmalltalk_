instruction stream support
blockMethodOrNilFor: anInstructionStream in: method at: pc
	"If anInstructionStream is at a block creation bytecode then answer the block's
	 CompiledBlock, otherwise answer nil.

	 The complication is that for convenience we allow the pc to point to the
	 raw send bytecode after its extension(s), or at the extension(s) preceeding it.
	249		11111001 	xxxxxxxx	siyyyyyy	push Closure Compiled block literal index xxxxxxxx (+ Extend A * 256) numCopied yyyyyy receiverOnStack: s = 1 ignoreOuterContext: i = 1"

	| byte |
	byte := method at: pc.
	byte = 249 ifTrue:
		["it could be extended..."
		 ^self extensionsFor: pc in: method into:
			[:extA :extB :nExtBytes|
			 method literalAt: (method at: pc + nExtBytes + 1) + (extA bitShift: 8) + 1]].
	^byte = 16rE0 ifTrue:
		[self extensionsAt: pc in: method into:
			[:extA :extB :nExtBytes|
			(method at: pc + nExtBytes) = 249 ifTrue:
				[method literalAt: (method at: pc + nExtBytes + 1) + (extA bitShift: 8) + 1]]]