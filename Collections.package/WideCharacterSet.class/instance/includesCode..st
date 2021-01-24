testing
includesCode: anInteger
	anInteger < 256 ifTrue: [ ^(byteArrayMap at: anInteger + 1) ~= 0 ].
	^((map at: (anInteger bitShift: highBitsShift) ifAbsent: nil) ifNil: [ ^false ])
		includes: (anInteger bitAnd: lowBitsMask)