private-IO
addToInBuf: aString

	| newAlloc |
	newAlloc := aString size * 2 max: 80000.
	inBuf ifNil: [
		inBuf := String new: newAlloc.
		inBufIndex := 1.
		inBufLastIndex := 0.
	].
	aString size > (inBuf size - inBufLastIndex) ifTrue: [
		inBuf := inBuf , (String new: newAlloc)
	].
	inBuf 
		replaceFrom: inBufLastIndex + 1 
		to: inBufLastIndex + aString size
		with: aString 
		startingAt: 1.
	inBufLastIndex := inBufLastIndex + aString size.
