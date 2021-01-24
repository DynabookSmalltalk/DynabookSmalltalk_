layout - visibility
hideOrShowScrollBars

	self removeProperty: #doLayoutAgainHere. "Detect change."
	
	"There is the one edge case where no scroll bar would be needed if both scroll bars would just disappear."
	(((((self vScrollBarPolicy = #whenNeeded and: [self hScrollBarPolicy = #whenNeeded])
		and: [self retractableScrollBar not])
		and: [self vIsScrollbarShowing and: [self hIsScrollbarShowing]])
		and: [self hLeftoverScrollRange <= self vScrollBar width])
		and: [self vLeftoverScrollRange <= self hScrollBar height])
			ifTrue: [^ self vHideScrollBar; hHideScrollBar].

	self 
		vHideOrShowScrollBar; 
		hHideOrShowScrollBar.