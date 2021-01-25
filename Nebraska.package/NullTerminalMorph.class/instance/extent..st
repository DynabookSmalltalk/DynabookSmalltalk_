geometry
extent: newExtent

	| aPoint |
	aPoint := 50@50.
	bounds extent = aPoint ifFalse: [
		self changed.
		bounds := bounds topLeft extent: aPoint.
		self layoutChanged.
		self changed
	].
	eventEncoder sendViewExtent: newExtent