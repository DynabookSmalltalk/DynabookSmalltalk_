drawing
infiniteFillRectangle: aRectangle fillStyle: aFillStyle

	self drawCommand: [ :c |
		c infiniteFillRectangle: aRectangle fillStyle: aFillStyle
	]