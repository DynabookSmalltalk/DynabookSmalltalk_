layout
volumeControl

	| volumeSlider r |
	volumeSlider := SimpleSliderMorph new
		color: color;
		sliderColor: Color gray;
		extent: 80@12;
		target: scorePlayer;
		actionSelector: #overallVolume:;
		adjustToValue: scorePlayer overallVolume.
	r := self makeRow
		hResizing: #spaceFill;
		vResizing: #rigid;
		height: 24.
	r addMorphBack: (StringMorph contents: 'soft  ' translated).
	r addMorphBack: volumeSlider.
	r addMorphBack: (StringMorph contents: ' loud' translated).
	^ r
