scanning
abstractBytecodeMessagesDo: aBlock
	"Evaluate aBlock with the sequence of abstract bytecodes in the receiver"
	self abstractBytecodeMessagesFrom: self initialPC
		to: self endPC
		do: aBlock

	"| msgs |
	 msgs := OrderedCollection new.
	 CompiledCode >> #abstractBytecodeMessagesFrom:to: abstractBytecodeMessagesDo:
		[:msg| msgs addLast: msg selector].
	 msgs"