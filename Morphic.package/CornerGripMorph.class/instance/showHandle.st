accessing
showHandle

	^ showHandle ifNil: [self class drawCornerResizeHandles]