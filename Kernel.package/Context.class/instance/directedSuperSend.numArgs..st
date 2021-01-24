instruction decoding
directedSuperSend: selector numArgs: numArgs
	"Simulate the action of bytecodes that send a message with selector, selector,
	 starting the message lookup in the superclass of the class on top of stack.
	 The arguments of the message are found in the next numArgs locations on
	 the stack and the receiver just below them."

	| class receiver arguments |
	class := self pop.
	arguments := Array new: numArgs.
	numArgs to: 1 by: -1 do: [ :i | arguments at: i put: self pop].
	receiver := self pop.
	QuickStep == self ifTrue:
		[QuickStep := nil.
		^self quickSend: selector to: receiver with: arguments lookupIn: class superclass].
	^self send: selector to: receiver with: arguments lookupIn: class superclass