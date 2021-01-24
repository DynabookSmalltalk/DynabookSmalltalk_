private-files
loadVersionFromFileNamed: aString
	^ self versionReaderForFileNamed: aString do: [:r | r version]