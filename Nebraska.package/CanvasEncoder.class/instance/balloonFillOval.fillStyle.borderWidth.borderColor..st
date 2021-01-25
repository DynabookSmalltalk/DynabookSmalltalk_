drawing
balloonFillOval: aRectangle fillStyle: aFillStyle borderWidth: bw borderColor: bc

	self sendCommand: {
		String with: CanvasEncoder codeBalloonOval.
		self class encodeRectangle: aRectangle.
		aFillStyle encodeForRemoteCanvas.
		self class encodeInteger: bw.
		self class encodeColor: bc.
	}