layout - scrolling
setScrollDeltas
	"Set the ScrollBar deltas, value and interval, based on the current scroll pane size, offset and range."

	scroller ifNil: [^ self].
	
	self hideOrShowScrollBars.
	self vSetScrollDelta.
	self hSetScrollDelta.