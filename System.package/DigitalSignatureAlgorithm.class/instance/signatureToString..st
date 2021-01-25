public
signatureToString: aSignature
	"Answer a string representation of the given signature. This string can be parsed using the stringToSignature: method."

	| s |
	s := WriteStream on: (String new: 2000).
	s nextPutAll: '[DSA digital signature '.
	s nextPutAll: aSignature first printStringHex.
	s space.
	s nextPutAll: aSignature second printStringHex.
	s nextPutAll: ']'.
	^ s contents
