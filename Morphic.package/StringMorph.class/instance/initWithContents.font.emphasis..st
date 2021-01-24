initialization
initWithContents: aStringOrText font: aFont emphasis: emphasisCode 

	self initialize.
	
	aStringOrText isText
		ifTrue: [self initializeFromText: aStringOrText]
		ifFalse: [
			self initializeFromString: aStringOrText.
			self font: aFont emphasis: emphasisCode].