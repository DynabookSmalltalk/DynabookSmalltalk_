display box access
computeBoundingBox 
	"Compute minimum enclosing rectangle around characters."

	| character font width carriageReturn lineWidth lineHeight |
	carriageReturn := Character cr.
	width := lineWidth := 0.
	font := textStyle defaultFont.
	lineHeight := textStyle lineGrid.
	1 to: text size do: 
		[:i | 
		character := text at: i.
		character = carriageReturn
		  ifTrue: 
			[lineWidth := lineWidth max: width.
			lineHeight := lineHeight + textStyle lineGrid.
			width := 0]
		  ifFalse: [width := width + (font widthOf: character)]].
	lineWidth := lineWidth max: width.
	^offset extent: lineWidth @ lineHeight