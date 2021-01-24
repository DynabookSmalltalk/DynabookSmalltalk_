drawing
drawBackgroundForMulti: row on: aCanvas 
	"shade the background paler, if this row is selected, but not the current selected row"
	| selectionDrawBounds |
	selectionDrawBounds := self drawBoundsForRow: row.
	selectionDrawBounds := selectionDrawBounds intersect: self bounds.
	aCanvas
		fillRectangle: selectionDrawBounds
		color: self multiSelectionColor