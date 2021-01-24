scrolling
scrollToShow: aRectangle

	| newOffset |
	newOffset := self offsetToShow: aRectangle.
	self hScrollBar setValue: newOffset x.
	self vScrollBar setValue: newOffset y.