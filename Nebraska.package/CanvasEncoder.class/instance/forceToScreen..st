drawing
forceToScreen: aRectangle
	self sendCommand: {
		String with: CanvasEncoder codeForce.
		self class encodeRectangle: aRectangle }