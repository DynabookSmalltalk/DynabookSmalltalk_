caching
versionInfoForFileNamed: aString
	^ cache at: aString ifAbsentPut: [self versionReaderForFileNamed: aString do: [:r | r info]]