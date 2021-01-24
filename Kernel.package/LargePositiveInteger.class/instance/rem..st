arithmetic
rem: aNumber 
	"Remainder defined in terms of quo:. See super rem:. Fail if
	 the argument is 0. Fail if either the argument or the result is not a
	 SmallInteger or a LargePositiveInteger in the 64 bit range.
	 Optional. See Object documentation whatIsAPrimitive."

	<primitive: 20>
	 aNumber isInteger
		ifTrue:
			[| rem |
			rem := (self divideByInteger: aNumber) at: 2.
			^ rem normalize].
	^super rem: aNumber