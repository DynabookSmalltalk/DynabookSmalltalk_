accessing
viewSize
	^ viewSize ifNil: [viewSize := Display extent // 8]