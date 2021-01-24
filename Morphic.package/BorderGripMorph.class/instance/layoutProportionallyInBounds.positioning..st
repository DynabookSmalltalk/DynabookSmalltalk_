layout
layoutProportionallyInBounds: layoutBounds positioning: cellPositioning

	super layoutProportionallyInBounds: layoutBounds positioning: cellPositioning.
	
	self flag: #workaround. "mt: We cannot know that our owner has always the correct properties at this time."
	self orientation = #vertical ifTrue: [
		self width: self class gripThickness + (self owner borderWidth * 2)].
	self orientation = #horizontal ifTrue: [
		self height: self class gripThickness + (self owner borderWidth * 2)].
