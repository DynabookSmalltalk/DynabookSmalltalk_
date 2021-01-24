menus
methodListMenu: aMenu
	super methodListMenu: aMenu.
	aMenu addList:#(-
		('ignore (I)'	ignoreSelection 'Toggle inclusion of this change when saving.')
		('refresh (e)'	refresh 'Refresh the list of changes to this package.')).
	^aMenu