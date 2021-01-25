printing
printOn: aStream 
	aStream nextPutAll: self class name.
	aStream nextPutAll: ' size='.
	size printOn: aStream.
	aStream nextPutAll: ', calls='.
	calls printOn: aStream.
	aStream nextPutAll: ', hits='.
	hits printOn: aStream.
	aStream nextPutAll: ', ratio='.
	(hits / calls) asFloat printOn: aStream