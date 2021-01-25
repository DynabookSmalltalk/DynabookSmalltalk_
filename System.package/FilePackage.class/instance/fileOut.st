fileIn/fileOut
fileOut
	"Ask the user for a file path where I should save my contents; if the file already exists ask for a replacement name"
	| fileName |
	fileName := UIManager default saveFilenameRequest: 'Enter the file name' initialAnswer: self fullPackageName.
	fileName ifNil:[^self].
	[FileStream
		newFileNamed: fileName
		do: [:stream | 
			sourceSystem isEmpty
				ifFalse: [stream nextChunkPut: sourceSystem printString;
						 cr].
			self fileOutOn: stream.
			stream cr; cr.
			self classes do: [:cls | cls needsInitialize
						ifTrue: [stream cr; nextChunkPut: cls name , ' initialize']].
			stream cr]
	] on: FileExistsException
		do: [:ex |  fileName := UIManager default saveFilenameRequest: 'Last entered filename already exists; try again' initialAnswer: self fullPackageName.
			ex retry]