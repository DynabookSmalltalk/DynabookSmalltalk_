updating
updateSlider

	| imagesNeedUpdate |
	imagesNeedUpdate := upButton width ~= (self orientation == #horizontal ifTrue: [self height] ifFalse: [self width]).
	
	self menuButton
		visible: (self orientation == #horizontal or: [self class scrollBarsWithoutMenuButton]) not;
		disableLayout: self menuButton visible not;
		bounds: self boundsForMenuButton.
	self upButton
		visible: self class scrollBarsWithoutArrowButtons not;
		disableLayout: self upButton visible not;
		bounds: self boundsForUpButton.
	self downButton
		visible: self class scrollBarsWithoutArrowButtons not;
		disableLayout: self downButton visible not;
		bounds: self boundsForDownButton.

	super updateSlider.

	pagingArea bounds: self totalSliderArea.
	self expandSlider.

	imagesNeedUpdate ifTrue: [
		self menuButton visible ifTrue: [self updateMenuButtonImage].
		self upButton visible ifTrue: [self updateUpButtonImage].
		self downButton visible ifTrue: [self updateDownButtonImage]].