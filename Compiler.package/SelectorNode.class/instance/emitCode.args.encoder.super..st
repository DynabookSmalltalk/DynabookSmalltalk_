code generation
emitCode: stack args: nArgs encoder: encoder super: supered
	code < Send ifTrue:
		[self internalEncodingError].
	stack pop: nArgs.
	supered
		ifTrue:
			[(encoder supportsFullBlocks
			  and: [encoder generatingFullBlock])
				ifTrue:
					[encoder genPushLiteral: (encoder sharableLitIndex: encoder classEncoding).
					 encoder genSendDirectedSuper: index numArgs: nArgs]
				ifFalse: [encoder genSendSuper: index numArgs: nArgs]]
		ifFalse:
			[encoder genSend: index numArgs: nArgs]