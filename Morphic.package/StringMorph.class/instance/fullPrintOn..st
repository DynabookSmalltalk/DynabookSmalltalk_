printing
fullPrintOn: aStream

	aStream nextPutAll: '('.
	super fullPrintOn: aStream.
	aStream nextPutAll: ') contents: '; print: contents