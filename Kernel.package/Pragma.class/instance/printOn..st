printing
printOn: aStream
	aStream
		nextPut: $<;
		print: self message;
		nextPut: $>.
	method ifNotNil:
		[:m|
		 aStream nextPutAll: ' "in '.
		 m printReferenceOn: aStream.
		 aStream nextPut: $"]