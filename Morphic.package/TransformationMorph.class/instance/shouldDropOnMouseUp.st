dropping/grabbing
shouldDropOnMouseUp
	
	^ self renderedMorph in: [:target |
		target == self
			ifTrue: [super shouldDropOnMouseUp]
			ifFalse: [target shouldDropOnMouseUp]]