accessing
normalized
	^ (MCRepositoryGroup default repositories includes: self)
		ifTrue: [ self ]
		ifFalse: [ self copy ]