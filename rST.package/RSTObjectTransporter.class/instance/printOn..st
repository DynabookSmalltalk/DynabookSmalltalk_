printing
printOn: aStream 
	super printOn: aStream.
	aStream nextPutAll: ' ';
		 nextPutAll: type asString;
		 nextPutAll: '=';
		 nextPutAll: object asString