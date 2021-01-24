access
versionNames
	^ versionNames ifNil:
		[ self initializeVersionNames.
		versionNames ]