visual properties
fillStyle: aFillStyle
	"Set the current fillStyle of the receiver."
	self setProperty: #fillStyle toValue: aFillStyle.
	"Workaround for Morphs not yet converted"
	color := aFillStyle asColor.
	self borderStyle trackColorFrom: self.
	self changed.