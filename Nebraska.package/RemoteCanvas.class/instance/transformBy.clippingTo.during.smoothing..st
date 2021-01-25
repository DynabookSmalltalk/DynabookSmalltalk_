drawing-support
transformBy: aDisplayTransform clippingTo: aClipRect during: aBlock smoothing: cellSize
	| newCanvas |

	self flag: #bob.		"do tranform and clip work together properly?"
	newCanvas := RemoteCanvas 
		connection: connection 
		clipRect: (aClipRect intersect: outerClipRect)
		transform: (transform composedWith: aDisplayTransform).
	newCanvas privateShadowColor: shadowColor.
	aBlock value: newCanvas.
	connection shadowColor: shadowColor.