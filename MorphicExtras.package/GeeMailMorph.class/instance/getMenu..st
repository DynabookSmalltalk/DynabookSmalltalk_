menus
getMenu: shiftKeyState

	| menu |
	menu := MenuMorph new defaultTarget: self.
	self addGeeMailMenuItemsTo: menu.
	^menu