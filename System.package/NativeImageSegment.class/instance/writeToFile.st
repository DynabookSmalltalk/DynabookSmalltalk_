read/write segment
writeToFile

	state = #active ifFalse: [self error: 'wrong state'. ^ self].
	Cursor write showWhile: [
		segmentName ifNil: [
			segmentName := (FileDirectory localNameFor: fileName) sansPeriodSuffix].
			"OK that still has number on end.  This is an unusual case"
		fileName := self class uniqueFileNameFor: segmentName.	"local name"
		(self class segmentDirectory newFileNamed: fileName) nextPutAll: segment; close.
		segment := nil.
		state := #onFile].