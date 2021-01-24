serializing
serializeInBinary: aSnapshot
	| writer s |
	s := RWBinaryOrTextStream on: String new.
	writer := DataStream on: s.
	writer nextPut: aSnapshot.
	^ s contents