testing
isOctetString
	"Answer whether the receiver can be represented as a byte string. 
	This is different from asking whether the receiver *is* a ByteString 
	(i.e., #isByteString)"
	1 to: self size do: [:pos |
		(self basicAt: pos) >= 256 ifTrue: [^ false].
	].
	^ true.
