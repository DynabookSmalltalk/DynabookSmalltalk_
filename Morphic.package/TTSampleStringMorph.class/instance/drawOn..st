drawing
drawOn: aCanvas
	| xStart |
	(font isNil or:[string isNil or:[string isEmpty]]) 
		ifTrue:[^aCanvas frameRectangle: self bounds color: Color black].
	xStart := 0.
	aCanvas asBalloonCanvas preserveStateDuring:[:balloonCanvas|
		balloonCanvas transformBy: self transform.
		balloonCanvas aaLevel: self smoothing.
		string do:[:char| | glyph |
			glyph := font at: char.
			balloonCanvas preserveStateDuring:[:subCanvas|
				subCanvas transformBy: (MatrixTransform2x3 withOffset: xStart@0).
				subCanvas 
					drawGeneralBezierShape: glyph contours
					color: self color 
					borderWidth: self borderWidth 
					borderColor: self borderColor].
			xStart := xStart + glyph advanceWidth.
		].
	].