accessing
suffixOf: aName
	"Answer the file extension of the given file, or an empty string should the file name be nil"
	^ aName
		ifNil:
			['']
		ifNotNil:
			[(FileDirectory extensionFor: aName) asLowercase]