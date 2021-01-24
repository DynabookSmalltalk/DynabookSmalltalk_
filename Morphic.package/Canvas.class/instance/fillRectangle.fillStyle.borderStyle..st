drawing-rectangles
fillRectangle: aRectangle fillStyle: aFillStyle borderStyle: aBorderStyle
	"For convenience and historical reasons only. Try to use the more explicit 'frameAndFill..' calls if you want to draw borders."

	self frameAndFillRectangle: aRectangle fillStyle: aFillStyle borderStyle: aBorderStyle.