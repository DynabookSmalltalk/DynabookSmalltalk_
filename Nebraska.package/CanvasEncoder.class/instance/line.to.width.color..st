drawing
line: pt1  to: pt2  width: w  color: c

"Smalltalk at: #Q3 put: thisContext longStack."
	self sendCommand: {
		String with: CanvasEncoder codeLine.
		self class encodePoint: pt1.
		self class encodePoint: pt2.
		self class encodeInteger: w.
		self class encodeColor: c
	}