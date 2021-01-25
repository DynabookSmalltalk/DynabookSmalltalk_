private
nextObjectLength
	"read the next object length from inBuf.  Returns nil if less than 4 bytes are available in inBuf"
	self inBufSize < 4 ifTrue: [ ^nil ].

	^inBuf getInteger32: inBufIndex