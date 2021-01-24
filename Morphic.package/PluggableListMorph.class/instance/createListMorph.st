initialization
createListMorph

	^ self listMorphClass new
		listSource: self;
		hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		cellPositioning: #leftCenter;
		setProperty: #indicateKeyboardFocus toValue: #never;
		yourself.