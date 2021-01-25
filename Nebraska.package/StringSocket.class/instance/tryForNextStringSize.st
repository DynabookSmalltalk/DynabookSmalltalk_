private-IO
tryForNextStringSize
	"grab the size of the next string, if it's available"

	self inBufSize >= 4 ifFalse: [^false].

	nextStringSize := inBuf getInteger32: inBufIndex.
	"nextStringSize > 100000 ifTrue: [self barf]."
	inBufIndex := inBufIndex + 4.
	
	nextStringSize < 0 ifTrue: [
		socket disconnect.
		^false ].
	
	^true
