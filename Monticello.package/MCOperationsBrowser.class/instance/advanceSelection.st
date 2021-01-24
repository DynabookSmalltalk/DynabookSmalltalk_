selecting
advanceSelection

	self selection < items size
		ifTrue: [self selection: self selection + 1]