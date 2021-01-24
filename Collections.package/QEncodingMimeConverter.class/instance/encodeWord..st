private-encoding
encodeWord: aString

	| characterEncodedString |
	(aString noneSatisfy: [:c | self conversionNeededFor: c])
		ifTrue: [^ aString].
	
	characterEncodedString := aString squeakToUtf8.
		
	^ String streamContents: [:stream |
		stream nextPutAll: '=?UTF-8?Q?'.
		characterEncodedString do: [:c | self encodeChar: c to: stream].
		stream nextPutAll: '?=']