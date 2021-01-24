target resize
apply: delta 
	| oldBounds |
	oldBounds := self target bounds.
	self target
		bounds: (oldBounds origin corner: oldBounds corner + (0 @ delta y))