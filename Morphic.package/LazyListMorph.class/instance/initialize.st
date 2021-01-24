initialization
initialize

	super initialize.

	self color: Color black.
	self cellInset: 3@0.

	font := Preferences standardListFont.
	
	listItems := nil.
	listIcons := nil.
	listFilterOffsets := nil.
	
	selectedRow := nil.
	selectedRows := PluggableSet integerSet.
	preSelectedRow := nil.