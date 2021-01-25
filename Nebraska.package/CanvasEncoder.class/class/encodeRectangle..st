encoding
encodeRectangle: rectangle
	| x y encoded cornerX cornerY |

	x := rectangle origin x asInteger.
	y := rectangle origin y asInteger.
	cornerX := rectangle corner x asInteger.
	cornerY := rectangle corner y asInteger.

	CanvasEncoder at: 2 count:  1.
	encoded := String new: 16.
	encoded putInteger32: x at: 1.
	encoded putInteger32: y at: 5.
	encoded putInteger32: cornerX at: 9.
	encoded putInteger32: cornerY at: 13.

	^encoded