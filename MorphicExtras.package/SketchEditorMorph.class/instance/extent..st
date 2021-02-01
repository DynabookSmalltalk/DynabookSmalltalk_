morphic
extent: aPoint 
	| form |
	paintingForm ifNil: [^super extent: aPoint].
	
	super extent: aPoint.
	form := Form extent: self extent depth: paintingForm depth.
	paintingForm displayOn: form.
	paintingForm := form.
	forEachHand do: [:i | i at: #changed put: true].
	rotationButton position: bounds topCenter - (6@0).		
	scaleButton position: bounds rightCenter - ((scaleButton width)@6).
	
	