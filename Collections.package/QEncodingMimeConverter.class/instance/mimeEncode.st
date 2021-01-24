conversion
mimeEncode
	"Do conversion reading from dataStream writing to mimeStream. Break long lines and escape non-7bit chars."
	
	| currentWord encodedWord |
	
	[dataStream atEnd] whileFalse: [
		self readUpToWordInto: mimeStream.
		currentWord := self readWord.
		encodedWord := self encodeWord: currentWord.
		mimeStream nextPutAll: encodedWord].
	
	^ mimeStream