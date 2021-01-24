handles
addScaleHandle: haloSpec
	
	(target isFlexMorph and: [target renderedMorph ~~ target])
		ifTrue: [(self addHandle: haloSpec
					on: #mouseDown send: #startScale:with: to: self)
					on: #mouseMove send: #doScale:with: to: self]
		ifFalse: [(self addHandle: haloSpec
					on: #mouseDown send: #startGrow:with: to: self)
					on: #mouseMove send: #doGrow:with: to: self].
