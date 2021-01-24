accessing
handleInset

	^ (handleInset notNil or: [self owner isNil])
		ifTrue: [handleInset ifNil: [1]]
		ifFalse: [self owner borderWidth max: 1]