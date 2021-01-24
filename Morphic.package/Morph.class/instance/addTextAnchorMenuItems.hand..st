text-anchor
addTextAnchorMenuItems: topMenu hand: aHand

	^ self textAnchorProperties 
		addTextAnchorMenuItems: topMenu 
		hand: aHand
		for: self