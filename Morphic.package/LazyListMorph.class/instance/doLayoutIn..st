layout
doLayoutIn: layoutBounds
	"Only consider #shrinkWrap. Other layout properties are implemented in #drawOn:."

	self adjustLayoutBounds.
	fullBounds := self outerBounds.