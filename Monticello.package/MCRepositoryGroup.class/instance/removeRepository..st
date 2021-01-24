update
removeRepository: aRepository
	| removed |
	removed := repositories remove: aRepository ifAbsent: [].
	removed ifNotNil: [ removed wasRemoved ].
	self changed: #repositories