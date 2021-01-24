geometry - layout
innerPosition: aPoint

	| prior delta |
	prior := self innerBounds.
	delta := (aPoint - prior topLeft) rounded.
	self innerBounds: (prior translateBy: delta).