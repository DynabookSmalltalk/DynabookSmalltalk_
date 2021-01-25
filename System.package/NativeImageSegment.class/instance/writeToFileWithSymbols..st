read/write segment
writeToFileWithSymbols: shortName

	segmentName := (shortName endsWith: '.seg')
		ifTrue: [shortName copyFrom: 1 to: shortName size - 4]
		ifFalse: [shortName].
	segmentName last isDigit ifTrue: [segmentName := segmentName, '-'].
	self writeToFileWithSymbols.