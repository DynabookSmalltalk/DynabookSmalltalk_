updating
update: aSymbol

	super update: aSymbol.
	aSymbol == getBgSelector ifTrue:
		[ (self isImage: self getBg) ifTrue:[image _ self drawImage: self getBg]
								ifFalse:[ image _ nil.
										self color: self getBg]]