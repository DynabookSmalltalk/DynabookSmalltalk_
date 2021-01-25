drawing
forceToFront: aRegion
	| highQuality |
	"force the given region from the drawing form onto the background form"

	highQuality := false.		"highQuality is slower"

	self updateBackgroundForm.
	backgroundForm
		copy: aRegion
		from: aRegion topLeft
		in: decoder drawingForm
		rule: Form over.
	self invalidRect: (
		highQuality ifTrue: [
			bounds
		] ifFalse: [
			(aRegion expandBy: 4) translateBy: bounds topLeft	"try to remove gribblys"
		]
	)
