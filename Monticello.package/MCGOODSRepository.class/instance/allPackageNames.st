packages
allPackageNames
	^ self root collect:
		[ : ea | ea package name ]