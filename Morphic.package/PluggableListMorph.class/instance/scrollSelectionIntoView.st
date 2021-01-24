selection
scrollSelectionIntoView
	"make sure that the current selection is visible"

	| row |
	(row := self selectionIndex) = 0
		ifFalse: [self scrollToShow: (self listMorph drawBoundsForRow: row)]