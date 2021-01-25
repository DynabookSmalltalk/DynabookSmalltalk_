printing
printOn: aStream 
	aStream nextPutAll: objectID asString;
		 nextPut: $@;
		 nextPutAll: brokerID asString