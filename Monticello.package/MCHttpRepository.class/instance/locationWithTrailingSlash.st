accessing
locationWithTrailingSlash
	^ (location endsWith: '/')
		ifTrue: [location]
		ifFalse: [location, '/']