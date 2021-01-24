public access
encoder
	^encoder ifNil:
		[encoder := CompiledMethod preferredBytecodeSetEncoderClass new]