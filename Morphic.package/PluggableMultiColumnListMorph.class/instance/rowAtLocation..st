accessing - items
rowAtLocation: aPoint
	"Return the row at the given point or 0 if outside"

	| pointInListMorphCoords rowIndex |
	pointInListMorphCoords := (self scroller transformFrom: self) transform: aPoint.

	listMorphs do: [:listMorph |
		rowIndex := listMorph rowAtLocation: pointInListMorphCoords.
		rowIndex > 0 ifTrue: [^ rowIndex]].

	^ 0
