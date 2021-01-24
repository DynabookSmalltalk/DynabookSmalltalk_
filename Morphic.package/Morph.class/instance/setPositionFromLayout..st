layout
setPositionFromLayout: aPoint
	"Sets the position for laying out children of the receiver. We have to move the children here. We avoid triggering #layoutChanged again. This implementation is based on #position:."
	
	| delta box |
	delta := (aPoint - self bounds topLeft) rounded.
	(delta x = 0 and: [delta y = 0]) ifTrue: [^ self].

	box := self privateFullBoundsForRedraw.
	self invalidRect: (box merge: (box translateBy: delta)).
	
	self privateFullMoveBy: delta.