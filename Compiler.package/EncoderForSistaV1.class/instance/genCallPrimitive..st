bytecode generation
genCallPrimitive: primitiveIndex
	"248	(2)	11111000 	iiiiiiii		mssjjjjj		Call Primitive #iiiiiiii + (jjjjj * 256) 
								m=1 means inlined primitive, no hard return after execution. 
								ss defines the unsafe operation set used to encode the operations. 
								(ss = 0 means sista unsafe operations, ss = 01 means lowcode operations, other numbers are not used)"
	"N.B. We could have made CallPrimitive a 2-byte code taking an extension, but that would
	 complicate the VM's determination of the primitive number and the primitive error code
	 store since the extension, being optional, would make the sequence variable length."
	(primitiveIndex < 1 or: [primitiveIndex > 32767]) ifTrue:
		[self outOfRangeError: 'primitive index' index: primitiveIndex range: 1 to: 32767].
	stream
		nextPut: 248;
		nextPut: (primitiveIndex bitAnd: 255);
		nextPut: (primitiveIndex bitShift: -8)