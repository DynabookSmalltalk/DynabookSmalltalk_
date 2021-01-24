as yet unclassified
mimeEncode

	| character |
	[dataStream atEnd] whileFalse: [
		character := dataStream next.
		self assert: character asciiValue < 128.
		mimeStream nextPut: character].
	
	^ mimeStream