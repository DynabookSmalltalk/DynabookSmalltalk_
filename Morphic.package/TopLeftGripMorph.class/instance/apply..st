target resize
apply: delta 
	| oldBounds |
	oldBounds := self target bounds.
	self target
		bounds: (oldBounds origin + delta corner: oldBounds corner)