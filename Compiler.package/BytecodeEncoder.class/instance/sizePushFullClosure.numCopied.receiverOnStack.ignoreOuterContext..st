opcode sizing
sizePushFullClosure: compiledBlockLiteralIndex numCopied: numCopied receiverOnStack: receiverOnStack ignoreOuterContext: ignoreOuterContext
	^self sizeOpcodeSelector: #genPushFullClosure:numCopied:receiverOnStack:ignoreOuterContext:
		withArguments: {compiledBlockLiteralIndex. numCopied. receiverOnStack. ignoreOuterContext}