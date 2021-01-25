drawing
stencil: stencilForm at: aPoint sourceRect: sourceRect color: aColor
	self sendCommand: {
		String with: CanvasEncoder codeStencil.
		self class encodeImage: stencilForm.
		self class encodePoint: aPoint.
		self class encodeRectangle: sourceRect.
		self class encodeColor: aColor }