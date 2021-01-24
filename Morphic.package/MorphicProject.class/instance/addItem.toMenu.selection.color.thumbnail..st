utilities
addItem: item toMenu: menu selection: action color: aColor thumbnail: aForm
	"Add menu item representing the sender to a menu"
	"Removed setting the color - it wasn't working well with dark color themes."

	menu
		add: item
		selector: #jumpToSelection:
		argument: action.
	aForm isNil
		ifFalse: [menu lastItem
				icon: (aForm
						scaledIntoFormOfSize: (Preferences tinyDisplay
								ifTrue: [16]
								ifFalse: [28]))]