accessing
verticalAlignmentLine: aSymbol
	"The vertical position within the line of text where the anchor point of the morph, specified by #verticalAlignmentMorph, should be attached."

	self assertValidAlignment: aSymbol.
	verticalAlignmentLine := aSymbol