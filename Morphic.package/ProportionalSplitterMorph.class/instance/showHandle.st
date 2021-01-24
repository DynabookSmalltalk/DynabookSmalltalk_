accessing
showHandle

	^ showHandle ifNil: [self class showSplitterHandles]