list management
selection

	^ self selectedRow ifNotNil: [:row |
		(row between: 1 and: self getListSize)
			ifTrue: [self item: row] 
			ifFalse: [nil]]