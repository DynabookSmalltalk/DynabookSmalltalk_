other events
mouseUpInSlider: event 

	slider borderStyle style == #inset
		ifTrue: [slider borderStyle: (BorderStyle raised width: slider borderWidth)].
	
	self hideSliderShadow.