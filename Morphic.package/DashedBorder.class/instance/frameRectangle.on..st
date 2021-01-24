drawing
frameRectangle: aRectangle on: aCanvas

	{
		aRectangle topLeft. aRectangle topRight - (1@0).
		aRectangle topRight - (1@0). aRectangle bottomRight - (1@1).
		aRectangle bottomRight - (1@1). aRectangle bottomLeft - (0@1).
		aRectangle bottomLeft - (0@1). aRectangle topLeft.
	} pairsDo: [:startPoint :endPoint |
		aCanvas
			line: startPoint to: endPoint
			width: self width
			color: self color
			dashLength: self dashLength
			secondColor: self gapColor
			secondDashLength: self gapLength
			startingOffset: self offset]