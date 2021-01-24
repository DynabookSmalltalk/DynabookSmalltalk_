instruction decoding
pushFullClosure: aCompiledBlock numCopied: numCopied receiverOnStack: rcvrOnStack ignoreOuterContext: ignoreOuterContext
	"Create a BlockClosure corresponding to the closure bytecode
	 and execute the action block with it. The created BlockClosure is only a pseudo value,
	 it is not populated with meaningful context and argument information."
	| block encoderClass endPC extractor subScanner |
	block := FullBlockClosure
				receiver: (rcvrOnStack ifTrue: [#onStackReceiver])
				outerContext: (ignoreOuterContext ifFalse: [currentContext])
				method: aCompiledBlock
				copiedValues: (Array new: numCopied).
	currentContext := block asContextWithSender: currentContext.
	action value: block.
	subScanner := aCompiledBlock scanner.
	extractor := self class withAction: action andScanner: subScanner.
	endPC := aCompiledBlock endPC.
	encoderClass := aCompiledBlock encoderClass.
	[subScanner pc <= endPC] whileTrue:
		[encoderClass interpretNextInstructionFor: extractor in: subScanner]