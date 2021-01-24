versions
allVersionsDo: aBlock
	self allPackageNames asArray sort
		do:
			[ : eachPackageName | | sortedVersions |
			sortedVersions := (self versionNamesForPackageNamed: eachPackageName) sort:
				[ : a : b | a versionNumber < b versionNumber ].
			sortedVersions
				do:
					[ : eachVersionName | (self versionNamed: eachVersionName) ifNotNil:
						[ : ver | aBlock value: ver ] ]
				displayingProgress:
					[ : eachVersionName | 'Importing ' , eachVersionName ] ]
		displayingProgress:
			[ : eachPackageName | 'Importing versions of ' , eachPackageName ]