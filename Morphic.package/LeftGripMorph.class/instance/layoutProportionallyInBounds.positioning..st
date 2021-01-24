layout
layoutProportionallyInBounds: cellBounds positioning: cellPositioning

	super layoutProportionallyInBounds: cellBounds positioning: cellPositioning.
	
	self flag: #workaround. "mt: We cannot know that our owner has always the correct new bounds at this time."
	self left: owner left.
	
	self top: owner top.
	self height: owner height.