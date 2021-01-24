printing
printOn: aStream 
	aStream nextPutAll: self class printString;
		 nextPutAll: ' with: ';
		 nextPutAll: self element printString