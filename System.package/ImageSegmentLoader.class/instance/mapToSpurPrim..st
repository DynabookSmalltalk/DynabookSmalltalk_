reading
mapToSpurPrim: header
	| primBits |
	primBits := header bitAnd: 16r100001FF.
	^(primBits bitAnd: 16r1FF) + (primBits bitShift: -19)