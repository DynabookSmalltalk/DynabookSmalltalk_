drawing
balloonFillRectangle: aRectangle fillStyle: aFillStyle

	self sendCommand: {
		String with: CanvasEncoder codeBalloonRect.
		self class encodeRectangle: aRectangle.
		aFillStyle encodeForRemoteCanvas
	}