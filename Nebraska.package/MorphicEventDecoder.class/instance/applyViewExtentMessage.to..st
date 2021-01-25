handling messages
applyViewExtentMessage: aStringArray to: aHand
	| newViewExtent |
	newViewExtent := CanvasDecoder decodePoint: aStringArray second.

	aHand setViewExtent: newViewExtent