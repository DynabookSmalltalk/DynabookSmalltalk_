private-files
versionInfoFromFileNamed: aString
	self cache at: aString ifPresent: [:v | ^ v info].
	^ self loadVersionInfoFromFileNamed: aString