ui construction
addARow: aCollectionOfMorphs

	| row |
	row := self inARow: aCollectionOfMorphs.
	self addMorphBack: row.
	^row