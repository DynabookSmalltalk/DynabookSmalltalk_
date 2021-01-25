drawing
balloonFillOval: aRectangle fillStyle: aFillStyle borderWidth: bw borderColor: bc

	self drawCommand: [ :executor |
		executor balloonFillOval: aRectangle fillStyle: aFillStyle borderWidth: bw borderColor: bc
	].