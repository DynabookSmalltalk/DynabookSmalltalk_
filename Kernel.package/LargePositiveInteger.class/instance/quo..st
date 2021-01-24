arithmetic
quo: anInteger 
	"Primitive. Divide the receiver by the argument and answer the result.
	 Round the result down towards zero to make it a whole integer. Fail if
	 the argument is 0. Fail if either the argument or the result is not a
	 SmallInteger or a LargePositiveInteger in the 64 bit range.
	 Optional. See Object documentation whatIsAPrimitive."

	<primitive: 33>
	^super quo: anInteger