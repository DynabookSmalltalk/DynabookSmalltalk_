layout - visibility
hShowScrollBar

	self hIsScrollbarShowing ifTrue: [^self].
	self hResizeScrollBar.
	self privateAddMorph: hScrollBar atIndex: 1.
	retractableScrollBar
		ifTrue: [self comeToFront]
		ifFalse: [self setProperty: #doLayoutAgainHere toValue: true].