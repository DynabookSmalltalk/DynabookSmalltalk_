code generation
sizeCode: encoder args: nArgs super: supered
	self reserve: encoder.
	code < Send ifTrue:
		[self internalEncodingError].
	supered ifFalse:
		[^encoder sizeSend: index numArgs: nArgs].
	(encoder supportsFullBlocks
	 and: [encoder generatingFullBlock]) ifTrue:
		[^(encoder sizePushLiteral: (encoder sharableLitIndex: encoder classEncoding))
		 + (encoder sizeSendDirectedSuper: index numArgs: nArgs)].
	^encoder sizeSendSuper: index numArgs: nArgs