arithmetic
/ anInteger 
	"Primitive. Divide the receiver by the argument and answer with the
	 result if the division is exact. Fail if the result is not a whole integer.
	 Fail if the argument is 0. Fail if either the argument or the result is not in 64 bit range.
	 Optional. See Object documentation whatIsAPrimitive."

	<primitive: 30>
	^super / anInteger