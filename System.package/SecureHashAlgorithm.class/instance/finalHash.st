private
finalHash
	"Concatenate the final totals to build the 160-bit integer result."
	"Details: If the primitives are supported, the results are in the totals array. Otherwise, they are in the instance variables totalA through totalE."

	| result |
	result := ByteArray new: 20.
	totals 
		ifNil: [ "compute final hash when not using primitives"
			result
				unsignedShortAt: 1 put: totalE low bigEndian: false;
				unsignedShortAt: 3 put: totalE hi bigEndian: false;
				unsignedShortAt: 5 put: totalD low bigEndian: false;
				unsignedShortAt: 7 put: totalD hi bigEndian: false;
				unsignedShortAt: 9 put: totalC low bigEndian: false;
				unsignedShortAt: 11 put: totalC hi bigEndian: false;
				unsignedShortAt: 13 put: totalB low bigEndian: false;
				unsignedShortAt: 15 put: totalB hi bigEndian: false;
				unsignedShortAt: 17 put: totalA low bigEndian: false;
				unsignedShortAt: 19 put: totalA hi bigEndian: false ]
		ifNotNil: [ "compute final hash when using primitives"
			result
				unsignedLongAt: 1 put: (totals at: 5) bigEndian: false;
				unsignedLongAt: 5 put: (totals at: 4) bigEndian: false;
				unsignedLongAt: 9 put: (totals at: 3) bigEndian: false;
				unsignedLongAt: 13 put: (totals at: 2) bigEndian: false;
				unsignedLongAt: 17 put: (totals at: 1) bigEndian: false ].
	LargePositiveInteger adoptInstance: result.
	^result normalize