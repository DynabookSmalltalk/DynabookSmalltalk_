accessing
initialize
	"FileServices initialize"
	FileReaderRegistry := nil.
	Smalltalk allClassesDo:[:aClass|
		(aClass class includesSelector: #fileReaderServicesForFile:suffix:)
			ifTrue:[self registerFileReader: aClass]].