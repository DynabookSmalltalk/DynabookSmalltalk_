scanning
abstractBytecodeMessagesAndPCs
	"Answer the receiver's sequence of abstract bytecodes as a sequence of tuples of bytecode message and pc."
	"(CompiledCode >> #abstractBytecodeMessagesAndPCs) abstractBytecodeMessagesAndPCs"
	| msgs initial endpc pc scanner encoderClass |
	scanner := InstructionStream new method: self pc: (initial := self initialPC).
	msgs := OrderedCollection new: (endpc  := self endPC) - initial.
	encoderClass := self encoderClass.
	[(pc := scanner pc) <= endpc] whileTrue:
		"i.e. nil will not understand any message and so the exception block will collect all of them."
		[[encoderClass interpretNextInstructionFor: nil in: scanner]
			on: MessageNotUnderstood
			do: [:ex| msgs addLast: { ex message. pc }]].
	^msgs