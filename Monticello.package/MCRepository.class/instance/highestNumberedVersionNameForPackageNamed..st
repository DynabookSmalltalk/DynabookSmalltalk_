versions
highestNumberedVersionNameForPackageNamed: aString 
	^ (self versionNamesForPackageNamed: aString)
		ifEmpty: [ self error: aString , ' not found in ' , self asString ]
		ifNotEmptyDo:
			[ : versionNames | versionNames detectMax:
				[ : each | each versionNumber ] ]