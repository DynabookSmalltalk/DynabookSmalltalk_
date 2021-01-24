arithmetic
reciprocal
	"Answer 1 divided by the receiver. Create an error notification if the 
	receiver is 0."

	self = 0
		ifTrue: [^ (ZeroDivide dividend: 1) signal]
		ifFalse: [^1 / self]
		