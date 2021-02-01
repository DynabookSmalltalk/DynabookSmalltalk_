menus
importBookmark
	| newDirectory importLinks filename file |
	newDirectory _ FillInTheBlank request: 'Directory to import' translated initialAnswer: bookDir pathName.
	(newDirectory isNil or: [ newDirectory isEmpty ]) ifTrue: [ ^self ].
	(FileDirectory new directoryExists: newDirectory)
		ifTrue:[importLinks _ self makeBookmark: (FileDirectory on: newDirectory).
				importLinks isEmpty 
					ifFalse:[importLinks associationsDo:[:ass | bookmark add: ass.
							(ass value isKindOf: Dictionary)
								ifTrue:[self createBookmarkFiles: bookDir dict: ass value dirname: ass key]
								ifFalse:[filename _ ass key,'.lin'.
										bookDir deleteFileNamed: filename.
										file _ StandardFileStream fileNamed: (bookDir fullNameFor: filename).
										file ifNil:[self error: 'could not save file' translated].
										file nextPutAll: ass value asString. 
										file close]
								]
							].
				]
		ifFalse:[self importBookmark].