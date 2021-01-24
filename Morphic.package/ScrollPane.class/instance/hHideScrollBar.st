layout - visibility
hHideScrollBar

	self hIsScrollbarShowing ifFalse: [^self].
	self removeMorph: hScrollBar.
	retractableScrollBar ifFalse: [self setProperty: #doLayoutAgainHere toValue: true].