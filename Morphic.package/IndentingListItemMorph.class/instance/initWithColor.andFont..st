initialization
initWithColor: aColor andFont: aFont

	(self hasProperty: #hasColorFromText)
		ifFalse: [self color: aColor].

	(self hasProperty: #hasEmphasisFromText)
		ifTrue: [
			(self hasProperty: #hasFontFromText)
				ifFalse: [self font: aFont "Keeps emphasis from text."]]
		ifFalse: [
			(self hasProperty: #hasFontFromText)
				ifTrue: [self emphasis: aFont emphasis "Keeps font from text."]
				ifFalse: [self font: aFont emphasis: aFont emphasis]]
