list management
selectedRow: index
	" Select the index-th row. Clear the pre selection highlight. If nil, remove the current selection. "

	self rowChanged: selectedRow with: index.
	selectedRow := index.
	preSelectedRow := nil.