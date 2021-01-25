printing
printOn: aStream 
	super printOn: aStream.
	aStream nextPutAll: ' last key=';
		 nextPutAll: lastKey asString;
		 nextPutAll: ', objects count=';
		 nextPutAll: dictionary size asString