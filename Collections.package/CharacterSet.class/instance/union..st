enumerating
union: aCollection
	(self isCharacters: aCollection) ifFalse: [^super union: aCollection].
	(self species = aCollection species and: [aCollection enumerationCost > self enumerationCost]) ifTrue: [^aCollection union: self].
	^self copy addAll: aCollection; yourself