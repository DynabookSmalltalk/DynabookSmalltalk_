arithmetic
\\ aNumber 
	"Primitive. Take the receiver modulo the argument. The result is the
	 remainder rounded towards negative infinity, of the receiver divided
	 by the argument. Fail if the argument is 0. Fail if either the argument
	 or the result is not a SmallInteger or a LargePositiveInteger in the 64 bit range.
	 Optional. See Object documentation whatIsAPrimitive."

	<primitive: 31>
	aNumber isInteger
		ifTrue:
			[| qr q r |
			qr := self divideByInteger: aNumber.
			q := qr first normalize.
			r := qr last normalize.
			^(q negative
				ifTrue: [r isZero not]
				ifFalse: [q isZero and: [self negative ~~ aNumber negative]])
					ifTrue: [r + aNumber]
					ifFalse: [r]].
	^super \\ aNumber
	