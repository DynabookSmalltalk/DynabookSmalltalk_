model access
changeModelSelection: aModelIndex
	" Change the model's selected item index to be aModelIndex. Optionally, do a pre-selection highlight, which requires an immediate re-draw of this widget."

	self class highlightPreSelection ifTrue: [
		self rowAboutToBecomeSelected: (self viewIndexFor: aModelIndex).
		self refreshWorld].
	setIndexSelector ifNotNil: [
		model perform: setIndexSelector with: aModelIndex ].