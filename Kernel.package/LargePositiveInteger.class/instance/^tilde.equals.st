comparing
~= anInteger 
	"Primitive. Compare the receiver with the argument and answer if the
	 receiver is equal to the argument. Fail if the receiver or argument is not
	 an integer in the 64 bit range.
	Optional. See Object documentation whatIsAPrimitive."

	<primitive: 28>
	^super ~= anInteger