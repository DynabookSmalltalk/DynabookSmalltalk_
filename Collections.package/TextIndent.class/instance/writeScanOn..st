fileIn/fileOut
writeScanOn: aStream

	aStream
		nextPut: self class scanCharacter;
		store: self amount.