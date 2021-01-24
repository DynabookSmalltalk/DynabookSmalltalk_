drawing
clipSubmorphs: aBool
	"Drawing specific. If this property is set, clip the receiver's submorphs to the receiver's clipping bounds."

	self fullBounds; changed.
	
	aBool == false
		ifTrue:[self removeProperty: #clipSubmorphs]
		ifFalse:[self setProperty: #clipSubmorphs toValue: aBool].
	
	self
		layoutChanged;
		fullBounds; changed.