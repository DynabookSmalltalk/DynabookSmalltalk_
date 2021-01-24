versions
versionWithInfo: aVersionInfo ifAbsent: errorBlock
	(self allFileNamesForVersionNamed: aVersionInfo versionName) do:
		[:fileName | | version |
		version := self versionNamed: fileName.
		version info = aVersionInfo ifTrue: [^ version]].
	^ errorBlock value