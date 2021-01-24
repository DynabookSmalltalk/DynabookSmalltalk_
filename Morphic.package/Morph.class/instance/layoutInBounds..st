layout
layoutInBounds: cellBounds
	
	self flag: #deprecated. "No actual deprecation warning because of debugging hazards."
	self
		layoutInBounds: cellBounds
		positioning: (self owner ifNil: [#center] ifNotNil: [:o | o cellPositioning]).