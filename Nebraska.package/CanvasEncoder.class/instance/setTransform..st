clipping and transforming
setTransform: newTransform
	self sendCommand: {
		String with: CanvasEncoder codeTransform.
		self class encodeTransform: newTransform }