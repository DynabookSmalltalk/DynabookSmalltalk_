drawing
balloonFillRectangle: aRectangle fillStyle: aFillStyle

	self drawCommand: [ :executor |
		executor balloonFillRectangle: aRectangle fillStyle: aFillStyle
	].