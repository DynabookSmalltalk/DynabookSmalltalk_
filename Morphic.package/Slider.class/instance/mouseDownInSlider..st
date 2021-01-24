other events
mouseDownInSlider: event 

	slider borderStyle style == #raised
		ifTrue: [slider borderStyle: (BorderStyle inset width: slider borderWidth)].
	
	self showSliderShadow.