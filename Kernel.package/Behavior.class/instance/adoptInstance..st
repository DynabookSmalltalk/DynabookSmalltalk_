instance creation
adoptInstance: anInstance
	"Change the class of anInstance to the receiver.
	 Primitive. Change the class of the argument anInstance into the receiver, provided
	 that the format of the receiver matches the format of the argument's class.
	 Fail if the argument is an immediate, or when the pointerness of the receiver is different
	 from the pointerness of the argument, or when the receiver is a fixed pointer class and
	 anInstance's size differs from the size that an instance of the receiver should have,
	 or when anInstance's size is not an integer multiple of the receiver's unit size."

	<primitive: 160 error: ec>
	^self primitiveFailed