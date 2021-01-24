*monticello
packageInfo
	^ (PackageInfo allPackages select: [ : each | each includesClass: self ])
		ifEmpty: [ nil ]
		ifNotEmpty:
			[ : myPackages | "Select the most-qualified match."
			myPackages detectMax: [ : each | each packageName size ] ]