instance creation
forPackageNamed: aString 
	^ self registry detect:
		[ : each | each packageName = aString ]