private
sendCommand: stringArray 
	| bucket |
	connection ifNil: [^self].
	connection isConnected ifFalse: [^self].
	connection nextPut: stringArray.
	SentTypesAndSizes ifNil: [^self].
	bucket := SentTypesAndSizes at: stringArray first
				ifAbsentPut: 
					[{ 
						0.
						0.
						0}].
	bucket at: 1 put: bucket first + 1.
	bucket at: 2
		put: (bucket second) 
				+ (stringArray inject: 4 into: [:sum :array | sum + (array size + 4)])