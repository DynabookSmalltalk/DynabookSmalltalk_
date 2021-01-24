accessing
verticalAlignmentMorph: aSymbol
	"The vertical position of the embedded Morph where it anchors to a line of text, its position within that line specified by #verticalAlignmentLine.."

	self assertValidAlignment: aSymbol.
	verticalAlignmentMorph := aSymbol