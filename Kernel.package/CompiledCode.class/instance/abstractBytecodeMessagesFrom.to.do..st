scanning
abstractBytecodeMessagesFrom: startpc to: endpc do: aBlock
	"Evaluate aBlock with the sequence of abstract bytecodes from startpc through endpc in the receiver"
	| scanner encoderClass |
	scanner := InstructionStream new method: self pc: startpc.
	encoderClass := self encoderClass.
	[scanner pc <= endpc] whileTrue:
		"i.e. nil will not understand any message and so the exception block will collect all of them."
		[[encoderClass interpretNextInstructionFor: nil in: scanner]
			on: MessageNotUnderstood
			do: [:ex| aBlock value: ex message]]

	"| m msgs |
	 msgs := OrderedCollection new.
	 (m := CompiledCode >> #abstractBytecodeMessagesFrom:to:do:)
		abstractBytecodeMessagesFrom: m initialPC
		to: m endPC
		do: [:msg| msgs add: msg selector].
	 msgs"