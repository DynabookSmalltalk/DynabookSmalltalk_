ancestry
allAncestors
	
	| allAncestors |
	allAncestors := Set new.
	self allAncestorsDo: [ :each | ] visitedAncestors: allAncestors.
	^allAncestors 