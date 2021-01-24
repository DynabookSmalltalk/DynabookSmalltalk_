layout - visibility
vHideScrollBar

	self vIsScrollbarShowing ifFalse: [^self].
	self removeMorph: scrollBar.
	retractableScrollBar ifFalse: [self setProperty: #doLayoutAgainHere toValue: true].