accessing
handleColor
	"Either use my handle color if set up or derive the handle color from my owner's color if I have an owner."
	
	^ (handleColor notNil or: [self owner isNil])
		ifTrue: [handleColor ifNil: [Color black]]
		ifFalse: [(self userInterfaceTheme resizerColorModifier ifNil: [ [:c | c muchDarker] ])
					value: (self owner color isTransparent ifTrue: [Color white] ifFalse: [self owner color]) ]