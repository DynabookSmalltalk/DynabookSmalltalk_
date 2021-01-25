fileIn/fileOut
fileOut
	| internalStream |
	internalStream := WriteStream on: (String new: 1000).
	self fileOutOn: internalStream.
	self needsInitialize ifTrue:[
		internalStream cr; nextChunkPut: self name,' initialize'.
	].

	FileStream writeSourceCodeFrom: internalStream baseName: self name isSt: true useHtml: false.
