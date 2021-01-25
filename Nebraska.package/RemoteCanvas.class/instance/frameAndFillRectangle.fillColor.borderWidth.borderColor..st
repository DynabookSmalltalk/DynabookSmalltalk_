drawing-rectangles
frameAndFillRectangle: bounds fillColor: fillColor borderWidth: borderWidth borderColor: borderColor
	"Draw the rectangle using the given attributes"

	self drawCommand: [ :executor |
		executor 
			frameAndFillRectangle: bounds 
			fillColor: fillColor 
			borderWidth: borderWidth 
			borderColor: borderColor
	].