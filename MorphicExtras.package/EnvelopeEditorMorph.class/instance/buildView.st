construction
buildView
	| frame |
	self color: Color lightGreen.
	self removeAllMorphs.
	frame := self innerBounds.
	self buildGraphAreaIn: frame.
	self buildScalesIn: frame.
	self addHandlesIn: frame.
	self addCurves.
	line addHandles.
	self addMorph: self makeControls.
	self addKeyboard