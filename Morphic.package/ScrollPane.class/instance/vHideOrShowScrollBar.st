layout - visibility
vHideOrShowScrollBar

	self vIsScrollbarNeeded
		ifTrue:[ self vShowScrollBar ]
		ifFalse:[ self vHideScrollBar ].
