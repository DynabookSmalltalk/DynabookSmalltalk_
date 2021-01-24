construction
addUpdatingItem: aBlock
	| item |
	item := UpdatingMenuItemMorph new.
	aBlock value: item.
	self addMenuItem: item