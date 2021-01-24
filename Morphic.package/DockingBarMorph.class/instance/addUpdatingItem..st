construction
addUpdatingItem: aBlock
	| item |
	item := DockingBarUpdatingItemMorph new.
	aBlock value: item.
	self addMorphBack: item