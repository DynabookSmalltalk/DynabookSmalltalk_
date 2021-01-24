drawing-rectangles
fillRoundRect: aRectangle radius: radius fillStyle: fillStyle borderStyle: borderStyle
	"For convenience only. Try to use 'frameAndFill...' messages."

	self
		frameAndFillRoundRect: aRectangle
		radius: radius
		fillStyle: fillStyle
		borderStyle: borderStyle.