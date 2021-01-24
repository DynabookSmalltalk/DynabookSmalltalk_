printing
fullPrintOn: aStream
	aStream nextPutAll: '('.
	super fullPrintOn: aStream.
	aStream nextPutAll: ') setBorderWidth: '; print: self borderWidth;
		nextPutAll: ' borderColor: ' , (self colorString: self borderColor)