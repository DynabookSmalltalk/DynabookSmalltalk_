utilities
inform: queryString
	"MenuMorph inform: 'I like Squeak'"
	| menu |
	menu := self new.
	menu addTitle: queryString icon: MenuIcons confirmIcon.
	menu add: 'OK' target: self selector: #yourself.
	MenuIcons decorateMenu: menu.
	menu invokeAt: ActiveHand position in: ActiveWorld allowKeyboard: true.