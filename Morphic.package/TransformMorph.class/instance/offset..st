accessing
offset: newOffset

	self offset = newOffset ifTrue: [^ self].
	transform := transform withOffset: newOffset - self innerBounds topLeft.
	self changed.