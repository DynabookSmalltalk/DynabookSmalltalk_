required
allFileNames
	^ self clientDo:
		[:client |
		self parseDirectoryListing: client getDirectory]