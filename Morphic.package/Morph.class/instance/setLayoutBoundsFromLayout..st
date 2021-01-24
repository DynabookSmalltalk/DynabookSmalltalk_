layout
setLayoutBoundsFromLayout: newLayoutBounds
	"Set the bounds for laying out children of the receiver. WE DO NOT MOVE CHILDREN HERE!
	
	Note that this code is written so that #layoutBounds can be changed without touching this method. For example, the layout bounds are smaller or larger than the current bounds.
	
	WE MUST NOT TRIGGER #layoutChanged AGAIN! See #doLayoutIn: and #adjustLayoutBounds."
	
	| priorBounds outer inner box |
	priorBounds := self outerBounds.
		
	outer := self bounds.
	inner := self layoutBounds.
	bounds := newLayoutBounds origin + (outer origin - inner origin) corner:
				newLayoutBounds corner + (outer corner - inner corner).
	
	bounds = outer ifFalse: [
		self removeProperty: #dropShadow.
		self invalidRect: (priorBounds quickMerge: self outerBounds)].