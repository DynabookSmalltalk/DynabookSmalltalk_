as yet unclassified
getChoice: aSymbol
	
	aSymbol == #acceptOnCR ifTrue: [^acceptOnCR ifNil: [true]].
	^false.
