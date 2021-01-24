layout
updateLayout
	"Manually layout my submorphs. Maybe we can find a proper layout policy in the future."
	
	self scroller hasSubmorphs ifTrue: [
		self scroller firstSubmorph changesHeightForWidth
			ifTrue: [self vHideScrollBar; resizeScroller; vHideOrShowScrollBar; resizeScroller]
			ifFalse: [self scroller firstSubmorph changesWidthForHeight
				ifTrue: [self hHideScrollBar; resizeScroller; hHideOrShowScrollBar; resizeScroller]
				ifFalse: [self resizeScroller]]].
	
	self
		resizeScrollBars;
		adjustOffset;
		setScrollDeltas.
