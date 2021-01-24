evaluating
collate: anObject with: another
	"Answer the collation order of anObject and another, with nil first or last according to direction"
	anObject ifNil: [^another ifNil: [0] ifNotNil: [direction]].
	another ifNil: [^direction negated].
	^baseSortFunction collate: anObject with: another