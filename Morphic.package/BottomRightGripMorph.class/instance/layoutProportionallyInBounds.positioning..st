layout
layoutProportionallyInBounds: layoutBounds positioning: cellPositioning

	self flag: #workaround. "mt: We cannot know that our owner has always the correct new bounds at this time."
	self bottomRight: owner bottomRight.