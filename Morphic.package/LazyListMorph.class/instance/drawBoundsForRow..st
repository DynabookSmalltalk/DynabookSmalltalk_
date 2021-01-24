list management
drawBoundsForRow: row
	"calculate the bounds that row should be drawn at.  This might be outside our bounds!"
	| topLeft drawBounds |
	topLeft := self topLeft x @ (self topLeft y + ((row - 1) * self rowHeight)).
	drawBounds := topLeft extent: self width @ self rowHeight.
	^drawBounds