instruction decoding
send: selector super: superFlag numArgs: numArgs
	"Simulate the action of bytecodes that send a message with selector, 
	 selector. The argument, superFlag, tells whether the receiver of the 
	 message was specified with 'super' in the source method. The arguments 
	 of the message are found in the top numArgs locations on the stack and 
	 the receiver just below them."

	| thisReceiver arguments lookupClass |
	arguments := Array new: numArgs.
	numArgs to: 1 by: -1 do: [ :i | arguments at: i put: self pop].
	thisReceiver := self pop.
	lookupClass := superFlag
					ifTrue: [method methodClassAssociation value superclass]
					ifFalse: [self objectClass: thisReceiver].
	QuickStep == self ifTrue:
		[QuickStep := nil.
		^self quickSend: selector to: thisReceiver with: arguments lookupIn: lookupClass].
	^self send: selector to: thisReceiver with: arguments lookupIn: lookupClass