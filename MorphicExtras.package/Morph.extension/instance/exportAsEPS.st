*MorphicExtras-postscript
exportAsEPS

	| fName |
	fName := UIManager default saveFilenameRequest:'Please enter the name' translated initialAnswer: self externalName,'.eps'.
	fName ifNil:[^self].
	self exportAsEPSNamed: fName
