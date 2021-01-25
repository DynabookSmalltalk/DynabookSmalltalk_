initialize
fromFileNamed: aName encoding: encodingName
	| stream |
	fullName := aName.
	stream := FileStream readOnlyFileNamed: aName.
	stream converter: (TextConverter newForEncoding: encodingName).
	self fileInFrom: stream.