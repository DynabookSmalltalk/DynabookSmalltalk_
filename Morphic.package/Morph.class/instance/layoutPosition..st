geometry - layout
layoutPosition: aPoint

	| prior delta |
	prior := self layoutBounds.
	delta := (aPoint - prior topLeft) rounded.
	self layoutBounds: (prior translateBy: delta).