private
initializeVersionNames
	repository cacheAllFileNamesDuring:
		[ super initializeVersionNames.
		allVersionNames := repository readableFileNames ]