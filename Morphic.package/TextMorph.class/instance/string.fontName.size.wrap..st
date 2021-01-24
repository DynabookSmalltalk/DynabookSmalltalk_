initialization
string: aString fontName: aName size: aSize wrap: shouldWrap

	shouldWrap
		ifTrue: [self contentsWrapped: aString]
		ifFalse: [self contentsAsIs: aString].

	self fontName: aName size: aSize