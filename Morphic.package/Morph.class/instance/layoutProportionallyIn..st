layout
layoutProportionallyIn: newBounds
	
	self flag: #deprecated. "No actual deprecation warning because of debugging hazards."
	self
		layoutProportionallyInBounds: newBounds
		positioning: (self owner ifNil: [#center] ifNotNil: [:o | o cellPositioning]).