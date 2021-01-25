initialization
connection: connection0 clipRect: clipRect0 transform: transform0
	connection := connection0.
	outerClipRect := clipRect0.
	transform := transform0.


	innerClipRect := transform globalBoundsToLocal: outerClipRect. 