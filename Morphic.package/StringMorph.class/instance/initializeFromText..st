initialization
initializeFromText: aText

	| scanner |
	scanner := StringMorphAttributeScanner new initializeFromStringMorph: self.

	(aText attributesAt: 1 forStyle: self font textStyle)
		do: [:attr | attr emphasizeScanner: scanner].

	font := scanner font emphasized: scanner emphasis.
	emphasis := scanner emphasis.
	
	color := scanner textColor.

	self contents: aText string.