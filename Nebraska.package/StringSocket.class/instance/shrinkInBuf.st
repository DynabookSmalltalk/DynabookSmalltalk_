private-IO
shrinkInBuf

	inBuf ifNil: [^self].
	inBufLastIndex < inBufIndex ifTrue: [
		inBufLastIndex := 0.
		inBufIndex := 1.
		inBuf size > 20000 ifTrue: [inBuf := nil].	"if really big, kill it"
		^self
	].
	inBuf := inBuf copyFrom: inBufIndex to: inBufLastIndex.
	inBufLastIndex := inBuf size.
	inBufIndex := 1.

