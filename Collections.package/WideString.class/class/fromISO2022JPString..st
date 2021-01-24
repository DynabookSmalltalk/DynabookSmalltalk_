instance creation
fromISO2022JPString: string 

	| tempFileName stream contents |
	tempFileName := Time millisecondClockValue printString , '.txt'.
	FileDirectory default deleteFileNamed: tempFileName ifAbsent: [].
	stream := StandardFileStream fileNamed: tempFileName.
	[stream nextPutAll: string]
		ensure: [stream close].
	stream := FileStream fileNamed: tempFileName.
	contents := stream contentsOfEntireFile.
	FileDirectory default deleteFileNamed: tempFileName ifAbsent: [].
	^ contents
