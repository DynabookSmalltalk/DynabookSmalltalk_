drawing
frameAndFillRectangle: r fillColor: fillColor borderWidth: borderWidth borderColor: borderColor

	self sendCommand: {
		String with: CanvasEncoder codeRect.
		self class encodeRectangle: r.
		fillColor encodeForRemoteCanvas.
		self class encodeInteger: borderWidth.
		self class encodeColor: borderColor
	}