initialize-release
setContents: aString

	self contents = aString ifTrue: [^ self].
	self contents: aString.
	self changed: #contents.