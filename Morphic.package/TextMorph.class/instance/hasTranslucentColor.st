accessing
hasTranslucentColor
	"Overridden from BorderedMorph to test backgroundColor instead of (text) color."

	^ self backgroundColor isNil
		or: [self backgroundColor isColor and: [self backgroundColor isTranslucentColor]]
		or: [self borderColor isColor and: [self borderColor isTranslucentColor]]