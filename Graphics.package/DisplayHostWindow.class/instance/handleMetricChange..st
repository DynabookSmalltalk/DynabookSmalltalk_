private-events
handleMetricChange: aRectangle
	"size or position of window changed"

	offset := aRectangle origin.

	(width = aRectangle width and: [height = aRectangle height])
		ifFalse: [self setExtent: aRectangle extent depth: depth].
