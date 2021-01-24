preferences
preferredBytecodeSetEncoderClass: aBytecodeEncoderSubclass
	"Set the class that determines the bytecode set used to compile methods with.
			[| nPrimary nSecondary |
			nPrimary := nSecondary := 0.
			self allSubInstancesDo:
				[:cm|
				cm header >= 0
					ifTrue: [nPrimary := nPrimary + 1]
					ifFalse: [nSecondary := nSecondary + 1]].
			{nPrimary. nSecondary}]"
	| nPrimary nSecondary |
	self assert: (aBytecodeEncoderSubclass includesBehavior: BytecodeEncoder).
	(aBytecodeEncoderSubclass == PrimaryBytecodeSetEncoderClass
	 or: [aBytecodeEncoderSubclass == SecondaryBytecodeSetEncoderClass]) ifTrue:
		[PreferredBytecodeSetEncoderClass := aBytecodeEncoderSubclass.
		 ^self].
	nPrimary := nSecondary := 0.
	self allSubInstancesDo:
		[:cm|
		 cm header >= 0
			ifTrue: [nPrimary := nPrimary + 1]
			ifFalse: [nSecondary := nSecondary + 1]].
	nPrimary = 0 ifTrue:
		[self installPrimaryBytecodeSet: aBytecodeEncoderSubclass.
		 ^self preferredBytecodeSetEncoderClass: aBytecodeEncoderSubclass].
	nSecondary = 0 ifTrue:
		[self installSecondaryBytecodeSet: aBytecodeEncoderSubclass.
		 ^self preferredBytecodeSetEncoderClass: aBytecodeEncoderSubclass].
	self error: 'Cannot set preferred bytecode set.  Both of the current sets appear to be in use.'