updating
rowChanged: oneRow with: anotherRow
	"Speed up drawing. Merge consecutive rows because the default damage recorder might not merge these rectangles."

	oneRow ifNil: [anotherRow ifNil: [^ self] ifNotNil: [^ self rowChanged: anotherRow]].
	anotherRow ifNil: [^ self rowChanged: oneRow].
	
	(oneRow - anotherRow) abs = 1
		ifTrue: [
			self invalidRect: ((self drawBoundsForRow: oneRow)
									quickMerge: (self drawBoundsForRow: anotherRow))]
		ifFalse: [
			self invalidRect: (self drawBoundsForRow: oneRow).
			self invalidRect: (self drawBoundsForRow: anotherRow)].