geometry - layout
outerBounds: aRectangle
	"Set the bounds for laying out children of the receiver.
	Note: written so that #outerBounds can be changed without touching this method"
	| outer inner |
	outer := self bounds.
	inner := self outerBounds.
	self bounds: (aRectangle origin + (outer origin - inner origin) corner:
				aRectangle corner + (outer corner - inner corner)).