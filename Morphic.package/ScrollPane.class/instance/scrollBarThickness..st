accessing
scrollBarThickness: anInteger
	
	scrollBarThickness := anInteger.
	
	self updateMinimumExtent.
	self layoutChanged.