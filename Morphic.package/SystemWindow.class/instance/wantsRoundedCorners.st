drawing
wantsRoundedCorners
	
	^ (self hasProperty: #cornerStyle)
		ifTrue: [super wantsRoundedCorners]
		ifFalse: [self class roundedWindowCorners]