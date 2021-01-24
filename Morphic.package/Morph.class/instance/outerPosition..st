geometry - layout
outerPosition: aPoint

	| prior delta |
	prior := self outerBounds.
	delta := (aPoint - prior topLeft) rounded.
	self outerBounds: (prior translateBy: delta).