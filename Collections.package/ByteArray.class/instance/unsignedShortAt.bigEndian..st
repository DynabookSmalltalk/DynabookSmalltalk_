platform independent access
unsignedShortAt: index bigEndian: bigEndian
	"Return a 16-bit unsigned integer quantity starting from the given byte index"

	bigEndian ifFalse: [ ^((self at: index + 1) bitShift: 8) + (self at: index) ].
	^((self at: index) bitShift: 8) + (self at: index + 1)
	