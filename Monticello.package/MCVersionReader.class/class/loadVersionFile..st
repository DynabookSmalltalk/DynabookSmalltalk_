file services
loadVersionFile: fileName 
	| version |
	version := self versionFromFile: fileName.
	version workingCopy repositoryGroup addRepository: (MCDirectoryRepository path: (FileDirectory dirPathFor: fileName)).
	version load