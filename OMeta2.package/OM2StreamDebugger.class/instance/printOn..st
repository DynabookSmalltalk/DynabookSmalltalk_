printing
printOn: aStream

	aStream nextPutAll: 'an OM2StreamDebugger('.
	om2stream printOn: aStream.
	aStream nextPut: $)