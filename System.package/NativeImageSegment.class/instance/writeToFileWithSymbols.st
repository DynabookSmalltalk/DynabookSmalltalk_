read/write segment
writeToFileWithSymbols
	| symbols nonSymbols pound |

	state = #extracted ifFalse: [self error: 'wrong state'].
	segmentName ifNil: [
		segmentName := (FileDirectory localNameFor: fileName) sansPeriodSuffix].
		"OK that still has number on end.  This is an unusual case"
	fileName := self class uniqueFileNameFor: segmentName.
	symbols := OrderedCollection new.
	nonSymbols := OrderedCollection new.
	pound := '#' asSymbol.
	outPointers do:
		[:s | 
		((s isSymbol) and: [s isLiteral and: [s ~~ pound]])
			ifTrue: [symbols addLast: s]
			ifFalse: [symbols addLast: pound.  nonSymbols addLast: s]].
	(self class segmentDirectory newFileNamed: fileName)
		store: symbols asArray; cr;
		nextPutAll: segment; close.
	outPointers := nonSymbols asArray.
	state := #onFileWithSymbols