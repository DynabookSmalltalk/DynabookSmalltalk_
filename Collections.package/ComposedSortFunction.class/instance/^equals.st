comparing
= aSortFunction
	self == aSortFunction ifTrue: [ ^true ].
	^self class = aSortFunction class and: [ baseSortFunction = aSortFunction baseSortFunction ]