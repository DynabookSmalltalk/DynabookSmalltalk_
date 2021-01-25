private-IO
tryForNumStringsInNextArray
	"input numStringsInNextARray, if 4 bytes are available"

	self inBufSize >= 4 ifFalse: [^false].

	numStringsInNextArray := inBuf getInteger32: inBufIndex.
	"(numStringsInNextArray > 100 or: [numStringsInNextArray < 1]) ifTrue: [self barf]."
	inBufIndex := inBufIndex + 4.

	numStringsInNextArray < 0 ifTrue: [
		socket disconnect.
		^false ].
	
	stringsForNextArray := Array new: numStringsInNextArray.
	stringCounter := 0.
	nextStringSize := nil. 
	^true