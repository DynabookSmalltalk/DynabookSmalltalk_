private-files
allFileNamesForVersionNamed: aMCVersionName 
	^ self
		filterFileNames: self readableFileNames
		forVersionNamed: aMCVersionName