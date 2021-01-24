accessing
verticalAlignmentMorph
	"The vertical position of the embedded Morph where it anchors to a line of text, its position within that line specified by #verticalAlignmentLine.."

	^ verticalAlignmentMorph ifNil: [ #center ]