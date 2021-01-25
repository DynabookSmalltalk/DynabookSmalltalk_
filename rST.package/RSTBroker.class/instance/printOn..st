printing
printOn: aStream 
	super printOn: aStream.
	aStream nextPutAll: ' brokerID:';
		 nextPutAll: brokerID asString;
		nextPutAll:' status:'; nextPutAll: status asString