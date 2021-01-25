decoding
drawCommand: aBlock
	"call aBlock with the canvas it should actually draw on so that the clipping rectangle and transform are set correctly"
	drawingCanvas transformBy: transform clippingTo: clipRect during: aBlock