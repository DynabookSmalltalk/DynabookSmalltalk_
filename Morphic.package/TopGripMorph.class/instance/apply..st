target resize
apply: delta 
	| oldBounds |
	oldBounds := self target bounds.
	self target
		bounds: (oldBounds origin + (0 @ delta y) corner: oldBounds corner)