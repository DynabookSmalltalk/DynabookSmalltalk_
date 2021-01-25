reading
mapToSpurHeader: header
	"Keep numLits, numArgs, and largeFrame bits, move numLits, set primitive flag"
	| primFlag numLits |
	primFlag := (header bitAnd: 16r100001FF) > 0 ifTrue: [16r10000] ifFalse: [0].
	numLits := header >> 9 bitAnd: 16rFF.
	^(header bitAnd: 16r0FFE0000) + primFlag + numLits
