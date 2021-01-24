initialize-release
initializeVersionNames
	repository cacheAllFileNamesDuring:
		[ versionNames := selectedPackage
			ifNil: [Array empty]
			ifNotNil: [repository versionNamesForPackageNamed: selectedPackage].
		self refreshEmphasis ]