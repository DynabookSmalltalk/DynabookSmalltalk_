initialization
initializeTextMorph

	textMorph := self textMorphClass new
		margins: (3@0 corner: 0@0);
		setEditView: self;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		setProperty: #indicateKeyboardFocus toValue: #never;
		yourself.