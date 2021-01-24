applying
applyTo: anObject
	self isResolved ifFalse: [self error: 'Cannot continue until this conflict has been resolved'].
	self remoteChosen ifTrue: [operation applyTo: anObject].