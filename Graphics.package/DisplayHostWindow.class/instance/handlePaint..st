private-events
handlePaint: aRectangle
	"window area needs updating. Some platforms do not need to send this, do not rely on it in image"

	self forceToScreen: aRectangle.
