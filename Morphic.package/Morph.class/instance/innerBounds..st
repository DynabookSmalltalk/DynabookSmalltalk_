geometry - layout
innerBounds: aRectangle
	"Set the bounds for laying out children of the receiver.
	Note: written so that #innerBounds can be changed without touching this method"
	| outer inner |
	outer := self bounds.
	inner := self innerBounds.
	self bounds: (aRectangle origin + (outer origin - inner origin) corner:
				aRectangle corner + (outer corner - inner corner)).