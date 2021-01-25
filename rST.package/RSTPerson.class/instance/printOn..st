printing
printOn: aStream 
	super printOn: aStream.
	aStream nextPutAll: ' name:';
		 nextPutAll: name asString;
		 nextPutAll: ' eMail:';
		 nextPutAll: eMail asString