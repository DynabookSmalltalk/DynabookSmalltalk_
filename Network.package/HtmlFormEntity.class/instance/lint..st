testing
lint: aStream
	form ifNil: [ aStream nextPutAll: '<', self tagName, '> not within a form'.
		aStream cr. ].
	super lint: aStream.