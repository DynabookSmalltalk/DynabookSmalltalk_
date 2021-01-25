private-IO
tryForString
	"try to grab an actual string"

	self inBufSize >= nextStringSize ifFalse: [^false].

	stringsForNextArray 
		at: (stringCounter := stringCounter + 1)
		put: (self inBufNext: nextStringSize) asString.

	stringCounter = numStringsInNextArray ifTrue: [	"we have finished another array!"
		inObjects addLast: stringsForNextArray.
		stringCounter := stringsForNextArray := numStringsInNextArray := nextStringSize := nil.
	] ifFalse: [	"still need more strings for this array"
		nextStringSize := nil.
	].

	^true
