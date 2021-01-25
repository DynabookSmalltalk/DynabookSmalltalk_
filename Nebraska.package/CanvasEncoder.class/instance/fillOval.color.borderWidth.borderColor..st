drawing
fillOval: r color: c borderWidth: borderWidth borderColor: borderColor
	self sendCommand: {
		String with: CanvasEncoder codeOval.
		self class encodeRectangle: r.
		self class encodeColor: c.
		self class encodeInteger: borderWidth.
		self class encodeColor: borderColor
	}