resize/collapse
followHand: aHand forEachPointDo: block1 lastPointDo: block2 withCursor: aCursor
	
	hand := aHand.
	hand showTemporaryCursor: aCursor "hotSpotOffset: aCursor offset negated".
	
	color := Color transparent.
	pointBlock := block1.
	lastPointBlock := block2.
	
	self borderWidth: 0.
	self position: hand lastEvent cursorPoint - (self extent // 2)