private
cacheAllFilenames
	allFileNamesCache ifNil:
		[ allFileNamesCache := self allFileNames.
		allVersionNamesCache := self allVersionNames ]