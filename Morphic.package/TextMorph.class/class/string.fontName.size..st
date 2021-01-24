instance creation
string: aString fontName: aName size: aSize

	^ self
		string: aString
		fontName: aName
		size: aSize
		wrap: false "...because we don't know the initial width to wrap..."
