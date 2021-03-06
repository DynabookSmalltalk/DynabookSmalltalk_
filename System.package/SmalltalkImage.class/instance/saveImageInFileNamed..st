sources, changes log
saveImageInFileNamed: aString
	| fullImageName |
	fullImageName := (FileDirectory default fullNameFor: aString).
	(FileDirectory default directoryNamed:(FileDirectory dirPathFor: fullImageName )) assureExistence.
	self
		changeImageNameTo: fullImageName;
		closeSourceFiles;
		openSourceFiles;  "so SNAPSHOT appears in new changes file"
		saveImageSegments;
		snapshot: true andQuit: false