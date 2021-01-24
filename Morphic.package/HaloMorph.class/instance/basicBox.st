private
basicBox
	| minSide outset anExtent aBox w |
	minSide := 4 * self handleSize.
	outset := 8 * RealEstateAgent scaleFactor.
	anExtent := (self extent + self handleSize + outset) max: minSide asPoint.
	aBox := Rectangle center: self center extent: anExtent.
	w := self world ifNil:[target outermostWorldMorph].
	^ w
		ifNil:
			[aBox]
		ifNotNil:
			[aBox intersect: (w viewBox insetBy: self handleSize // 2)]
