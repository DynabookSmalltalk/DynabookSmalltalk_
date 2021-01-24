accessing
verticalAlignmentLine
	"The vertical position within the line of text where the anchor point of the morph, specified by #verticalAlignmentMorph, should be attached."

	^ verticalAlignmentLine ifNil: [ #center ]