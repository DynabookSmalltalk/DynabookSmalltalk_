drawing-rectangles
frameRectangle: aRectangle borderStyle: aBorderStyle
	"Double dispatch."

	aBorderStyle frameRectangle: aRectangle on: self.