initialization
initializeFromText: aText
	"Overridden to keep track of text-based attributes."
	
	| priorFont priorEmphasis priorColor |
	priorFont := self font.
	priorEmphasis := self emphasis.
	priorColor := self color.
	
	super initializeFromText: aText.
	
	priorFont == self font
		ifFalse: [self setProperty: #hasFontFromText toValue: true].
	priorFont == self emphasis
		ifFalse: [self setProperty: #hasEmphasisFromText toValue: true].
	priorColor == self color
		ifFalse: [self setProperty: #hasColorFromText toValue: true].