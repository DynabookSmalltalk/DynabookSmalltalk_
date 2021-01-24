versions
copyAllFrom: aMCRepository 
	"Copy all MCVersions from aMCRepository to the receiver."
	self cacheAllFileNamesDuring:
		[ aMCRepository cacheAllFileNamesDuring:
			[ | pkgCount |
			pkgCount := 0.
			'Copy all package versions from ' , aMCRepository description
				displayProgressFrom: 0
				to: aMCRepository allPackageNames size
				during:
					[ : pkgBar | aMCRepository allPackageNames asArray sort do:
						[ : eachPackageName | | versions verCount |
						verCount := 0.
						versions := (aMCRepository versionNamesForPackageNamed: eachPackageName) difference: (self versionNamesForPackageNamed: eachPackageName).
						'Progress for ' , eachPackageName
							displayProgressFrom: 0
							to: versions size
							during:
								[ : verBar | versions do:
									[ : eachVersionName | (aMCRepository versionNamed: eachVersionName) ifNotNil:
										[ : ver | self storeVersion: ver ].
									verBar value: (verCount := verCount + 1) ].
								pkgBar value: (pkgCount := pkgCount + 1) ] ] ] ] ]