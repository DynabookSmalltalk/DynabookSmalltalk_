drawing
shadowColor: aFillStyle

	self sendCommand: {
		String with: CanvasEncoder codeShadowColor.
		aFillStyle ifNil: ['0'] ifNotNil: [aFillStyle encodeForRemoteCanvas].
	}