private-IO
inBufNext: anInteger
	
	| answer |
	answer := inBuf copyFrom: inBufIndex to: inBufIndex + anInteger - 1.
	inBufIndex := inBufIndex + anInteger.
	^answer