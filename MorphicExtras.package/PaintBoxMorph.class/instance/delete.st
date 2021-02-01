actions
delete
			
	^ self isSupersized
		ifTrue: [self owner delete]
		ifFalse: [super delete]