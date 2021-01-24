layout
listChanged
	"set newList to be the list of strings to display"

	listItems := nil.
	listIcons := nil.
	listFilterOffsets := nil.

	maxWidth := nil.
		
	selectedRow := nil.
	selectedRows := PluggableSet integerSet.
	preSelectedRow := nil.
	
	self layoutChanged.
	self changed.
