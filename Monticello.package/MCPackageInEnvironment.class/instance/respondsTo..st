delegating
respondsTo: aSymbol
	^ (MCPackageInEnvironment canUnderstand: aSymbol)
		or: [package respondsTo: aSymbol]