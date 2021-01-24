initialization
initialize
	super initialize.

	self setDefaultParameters.

	self changeTableLayout.
	self listDirection: #topToBottom.
	self hResizing: #shrinkWrap.
	self vResizing: #shrinkWrap.
	defaultTarget := nil.
	selectedItem := nil.
	stayUp := false.
	popUpOwner := nil.