drawing
testRectangleFillTiming
| r fillColor borderWidth borderColor t |
"
CanvasEncoder new testRectangleFillTiming
"
	r := 100@100 extent: 300@300.
	fillColor := Color blue.
	borderWidth := 1.
	borderColor := Color red.
	t := Time millisecondsToRun: [
		1000 timesRepeat: [
		{
		String with: CanvasEncoder codeRect.
		self class encodeRectangle: r.
		self class encodeColor: fillColor.
		self class encodeInteger: borderWidth.
		self class encodeColor: borderColor }
		].
	].
	t inspect.