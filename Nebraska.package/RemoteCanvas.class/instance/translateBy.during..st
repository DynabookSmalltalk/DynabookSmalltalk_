drawing-support
translateBy: delta during: aBlock
	self transformBy: (MorphicTransform offset: delta negated) clippingTo: outerClipRect during: aBlock smoothing: 1