menus
methodListMenu: aMenu 
	super methodListMenu: aMenu.
	self selectedMessageName
		ifNotNil: [:msgName | aMenu addLine; add: 'load method' translated action: #loadMethodSelection].
	^ aMenu