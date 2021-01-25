measuring
widthOf: aCharacter
	^ (baseFont hasGlyphOf: substitutionCharacter)
		ifTrue: [baseFont widthOf: substitutionCharacter]
		ifFalse: [1]