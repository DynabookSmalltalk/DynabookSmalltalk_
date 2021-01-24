accessing
allFullFileNames
	| cachedPackages |
	cachedPackages := smCache map installedPackages select: [ :ea | ea isCached ].
	^Array streamContents: [ :s |
		cachedPackages do: [ :ea | | d |
			d := ea cacheDirectory.
			(d fileNamesMatching: '*.mcz') do: [ :fn | s nextPut: (d fullNameFor: fn) ]]]