layout
layoutProportionallyInBounds: layoutBounds positioning: cellPositioning
	"Layout specific. Apply the given bounds to the receiver."
	| cellBounds frame |
	frame := self layoutFrame ifNil:[^self].
	"compute the cell size the receiver has given its layout frame"
	
	cellBounds := frame layout: self bounds in: layoutBounds.
	cellBounds := cellBounds topLeft extent: (cellBounds extent max: self minExtent).
	
	cellBounds = self bounds ifTrue: [^self]. "no change"
	^self layoutInBounds: cellBounds positioning: cellPositioning