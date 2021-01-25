drawing
infiniteFillRectangle: aRectangle fillStyle: aFillStyle

	self sendCommand: {
		String with: CanvasEncoder codeInfiniteFill.
		self class encodeRectangle: aRectangle.
		aFillStyle encodeForRemoteCanvas
	}