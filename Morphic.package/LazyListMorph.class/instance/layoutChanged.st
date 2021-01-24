layout
layoutChanged
	"See #item:. We have to invalidate listItems or maxWidth will not be updated if you switch hResizing to #shrinkWrap."
	
	listItems := nil.
	maxWidth := nil.
	iconExtent := nil.
	
	super layoutChanged.