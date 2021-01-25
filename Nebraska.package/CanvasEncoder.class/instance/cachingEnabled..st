drawing
cachingEnabled: aBoolean

	(cachingEnabled := aBoolean) ifFalse: [
		cachedObjects := nil.
	].
