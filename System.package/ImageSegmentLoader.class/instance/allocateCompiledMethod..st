allocating
allocateCompiledMethod: nBytes
	"CompiledMethods need special handling:
	- the method header bits changed
	- the primitive is now the first 3 bytecodes
	- the trailer encoding changed, too
	Here we calculate the new size needed after adding
	the primitive byte codes, stripping the old trailer and
	adding one byte for the NoTrailer code."
	| header numLits bytecodes lastByte trailerBytes |
	header := self mapOop: (self uint32At: position + 4).
	header := self mapToSpurHeader: header.
	numLits := header bitAnd: 16rFF.
	bytecodes := nBytes - (1 + numLits * 4). "subtract header and literals"
	lastByte := self uint8At: position + nBytes.
	trailerBytes := lastByte = 0 ifTrue: "up to four 0 bytes"
		[(self uint8At: position + nBytes - 1) = 0 ifFalse: [1] ifTrue:
			[(self uint8At: position + nBytes - 2) = 0 ifFalse: [2] ifTrue:
				[(self uint8At: position + nBytes - 3) = 0 ifFalse: [3] ifTrue: [4]]]] ifFalse:
		[lastByte < 252 ifTrue:
			[lastByte + 1 "Magic sources (tempnames encoded in last bytes)"] ifFalse:
			[4 "Normal 4-byte source pointer"]].
	"subtract old trailer, add 1 byte for new trailer"
	bytecodes := (bytecodes - trailerBytes max: 0) + 1.
	"add 3 bytes for prim call"
	(header bitAnd: 16r10000) > 0 ifTrue: [bytecodes := bytecodes + 3].
	^CompiledMethod newMethod: bytecodes header: header