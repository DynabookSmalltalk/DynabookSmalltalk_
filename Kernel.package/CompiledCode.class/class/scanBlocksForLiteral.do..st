scanning
scanBlocksForLiteral: aLiteral do: aBinaryBlock
	"Evaluate aBinaryBlock with the literal scanners for aLiteral (which will be nil
	 if there are no special bytecodes that access aLiteral), and answer its value."
	^aBinaryBlock
		value: (PrimaryBytecodeSetEncoderClass scanBlockOrNilForLiteral: aLiteral)
		value: (SecondaryBytecodeSetEncoderClass scanBlockOrNilForLiteral: aLiteral)