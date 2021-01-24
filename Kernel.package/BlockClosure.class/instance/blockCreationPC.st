scanning
blockCreationPC
	"Answer the pc for the bytecode that created the receiver."
	| method |
	method := self method.
	^method encoderClass
		pcOfBlockCreationBytecodeForBlockStartingAt: startpc
		in: method