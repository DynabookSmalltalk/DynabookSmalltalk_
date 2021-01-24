accessing
hoverRow: viewIndex

	hoverRow = viewIndex ifTrue: [^ self].
	
	self listMorph rowChanged: hoverRow with: viewIndex.
	hoverRow := viewIndex.
	
	self wantsBalloon ifTrue: [
		self activeHand
			removePendingBalloonFor: self;
			triggerBalloonFor: self after: self balloonHelpDelayTime].