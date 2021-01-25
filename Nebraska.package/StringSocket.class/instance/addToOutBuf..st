private-IO
addToOutBuf: arrayToWrite

	| size newAlloc |
	size := self spaceToEncode: arrayToWrite.
	newAlloc := size * 2 max: 8000.	"gives us room to grow"
	outBuf ifNil: [
		outBuf := String new: newAlloc.
		outBufIndex := 1.
	].
	outBuf size - outBufIndex + 1 < size ifTrue: [
		outBuf := outBuf , (String new: newAlloc).
	].
	CanvasEncoder at: 1 count: arrayToWrite size + 1.
	outBuf putInteger32: arrayToWrite size at: outBufIndex.
	outBufIndex := outBufIndex + 4.
	arrayToWrite do: [ :each |
		outBuf putInteger32: each size at: outBufIndex.
		outBufIndex := outBufIndex + 4.
		outBuf 
			replaceFrom: outBufIndex 
			to: outBufIndex + each size - 1 
			with: each 
			startingAt: 1.
		outBufIndex := outBufIndex + each size.
	].
	^size