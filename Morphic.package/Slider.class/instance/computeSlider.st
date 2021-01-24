geometry
computeSlider
	| r v |
	r := self roomToMove.
	v := self maximumValue = self minimumValue
		ifTrue: [0]
		ifFalse: [(value - self minimumValue) / (self maximumValue - self minimumValue)].
	self descending
		ifFalse:
			[self moveSliderTo: (self orientation == #horizontal
				ifTrue: [r topLeft + ((r width * v) asInteger @ 0)]
				ifFalse: [r topLeft + (0 @ (r height * v)  asInteger)])]
		ifTrue:
			[self moveSliderTo: (self orientation == #horizontal
				ifTrue:	[r bottomRight - ((r width * v) asInteger @ 0)]
				ifFalse:	[r bottomRight - ((0 @ (r height * v) asInteger))])].
	self resizeSliderTo: self sliderExtent.