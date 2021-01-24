accessing
cacheDirectory
	^ (FileDirectory default directoryNamed: 'package-cache')
		assureExistence;
		yourself