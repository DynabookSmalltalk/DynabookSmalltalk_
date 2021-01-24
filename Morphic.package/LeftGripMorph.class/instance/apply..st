target resize
apply: delta 
	| oldBounds |
	oldBounds := self target bounds.
	self target
		bounds: (oldBounds origin + (delta x @ 0) corner: oldBounds corner)