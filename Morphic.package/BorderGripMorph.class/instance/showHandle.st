accessing
showHandle

	^ showHandle ifNil: [self class drawEdgeResizeHandles]