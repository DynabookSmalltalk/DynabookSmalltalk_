private-encoding
readWord

	| strm |
	strm := WriteStream on: (String new: 20).
	[dataStream atEnd] whileFalse: [
		dataStream peek isSeparator 
			ifTrue: [^ strm contents] 
			ifFalse: [strm nextPut: dataStream next]].
	^ strm contents