accessing
handleInset

	^ (handleInset notNil or: [self owner isNil])
		ifTrue: [handleInset ifNil: [2]]
		ifFalse: [(self owner borderWidth max: 1) * 2]