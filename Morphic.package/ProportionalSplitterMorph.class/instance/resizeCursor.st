accessing
resizeCursor

	^ Cursor resizeForEdge: (splitsTopAndBottom
		ifTrue: [#top]
		ifFalse: [#left])
		