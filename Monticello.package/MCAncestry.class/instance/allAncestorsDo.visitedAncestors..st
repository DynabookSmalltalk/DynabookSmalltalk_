ancestry
allAncestorsDo: aBlock visitedAncestors: visitedAncestors
	self ancestors do: [ :each |
		(visitedAncestors ifAbsentAdd: each) ifTrue: [
			aBlock value: each.
			each allAncestorsDo: aBlock visitedAncestors: visitedAncestors ] ]