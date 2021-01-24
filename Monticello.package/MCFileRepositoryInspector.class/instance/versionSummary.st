morphic ui
versionSummary
	^ version
		ifNotNil: [version summary]
		ifNil: [self versionInfo summary]