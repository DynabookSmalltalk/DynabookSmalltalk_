*System-FileRegistry
viewContents: fullFileName
	"Open the decompressed contents of the .gz file with the given name.  This method is only required for the registering-file-list of Squeak 3.3a and beyond, but does no harm in an earlier system"

	(FileStream readOnlyFileNamed: fullFileName) ifNotNil:
		[:aStream | | contents |
		contents := Cursor wait showWhile: [aStream viewGZipContents].
		UIManager default
			edit: contents
			label: 'Decompressed contents of: ', aStream localName].