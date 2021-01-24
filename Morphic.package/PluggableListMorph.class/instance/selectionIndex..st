selection
selectionIndex: viewIndex
	"Called internally to select the index-th item."

	self unhighlightSelection.
	self listMorph selectedRow: (viewIndex min: self listSize).
	self highlightSelection.
	
	self scrollSelectionIntoView.