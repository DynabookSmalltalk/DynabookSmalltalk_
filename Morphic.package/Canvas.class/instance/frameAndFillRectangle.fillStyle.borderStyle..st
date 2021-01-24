drawing-rectangles
frameAndFillRectangle: aRectangle fillStyle: aFillStyle borderStyle: aBorderStyle

	aFillStyle isTransparent ifFalse: [
		self fillRectangle: (aRectangle insetBy: aBorderStyle inset) fillStyle: aFillStyle].

	aBorderStyle width > 0 ifTrue: [
		self frameRectangle: aRectangle borderStyle: aBorderStyle].