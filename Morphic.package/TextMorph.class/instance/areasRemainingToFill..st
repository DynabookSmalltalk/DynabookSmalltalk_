drawing
areasRemainingToFill: aRectangle
	"Overridden from BorderedMorph to test backgroundColor instead of (text) color."
	(self backgroundColor isNil or: [self backgroundColor asColor isTranslucent])
		ifTrue: [^ Array with: aRectangle].
	self wantsRoundedCorners
	ifTrue: [(self borderWidth > 0 and: [self borderColor isColor and: [self borderColor isTranslucent]])
				ifTrue: [^ aRectangle areasOutside: (self innerBounds intersect: self boundsWithinCorners)]
				ifFalse: [^ aRectangle areasOutside: self boundsWithinCorners]]
	ifFalse: [(self borderWidth > 0 and: [self borderColor isColor and: [self borderColor isTranslucent]])
				ifTrue: [^ aRectangle areasOutside: self innerBounds]
				ifFalse: [^ aRectangle areasOutside: self bounds]]