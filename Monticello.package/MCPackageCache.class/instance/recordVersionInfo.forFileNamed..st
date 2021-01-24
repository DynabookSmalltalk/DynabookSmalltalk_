recording
recordVersionInfo: aVersionInfo forFileNamed: aString
	Transcript cr; show: aString.
	fileNames at: aVersionInfo put: aString.
	sorter addVersionInfo: aVersionInfo