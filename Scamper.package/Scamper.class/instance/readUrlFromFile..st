user interface
readUrlFromFile: aFile
	| oldFile url |
	oldFile _ FileStream oldFileOrNoneNamed: aFile.
	oldFile isBinary 
		ifTrue:[ self error: 'not url file' translated]
		ifFalse:[url _ (oldFile contentsOfEntireFile) withBlanksTrimmed.
				url =='' ifTrue:[ self error: 'blank file: url not exist' translated].
				^url asUrl].
	