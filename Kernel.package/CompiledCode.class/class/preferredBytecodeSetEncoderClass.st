preferences
preferredBytecodeSetEncoderClass
	<preference: 'Preferred bytecode set encoder class'
	  category: 'Compiler'
	  description: 'The system supports up to two bytecode sets; select the preferred one to use here.  See CompiledCode class variables PrimaryBytecodeSetEncoderClass and SecondaryBytecodeSetEncoderClass.'
	  type: #Class>
	^PreferredBytecodeSetEncoderClass ifNil: [PrimaryBytecodeSetEncoderClass]