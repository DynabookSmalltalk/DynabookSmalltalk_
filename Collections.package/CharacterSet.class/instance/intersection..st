enumerating
intersection: aCollection
	(self species = aCollection species and: [aCollection enumerationCost < self enumerationCost]) ifTrue: [^aCollection intersection: self].
	^ self select: [:each | aCollection includes: each]