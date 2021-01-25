clipping and transforming
setClipRect: newClipRect
	self sendCommand: {
		String with: CanvasEncoder codeClip.
		self class encodeRectangle: newClipRect }