menu & halo
putUpPenTrailsSubmenu
	"Put up the pen trails menu"

	| aMenu |
	aMenu := MenuMorph new defaultTarget: self.
	aMenu title: 'pen trails' translated.
	aMenu addStayUpItem.
	self addPenTrailsMenuItemsTo: aMenu.
	aMenu popUpInWorld: ActiveWorld