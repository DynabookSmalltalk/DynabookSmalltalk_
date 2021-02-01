ui construction
addAColumn: aCollectionOfMorphs

	| col |
	col := self inAColumn: aCollectionOfMorphs.
	self addMorphBack: col.
	^col