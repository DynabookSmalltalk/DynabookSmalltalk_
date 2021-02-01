as yet unclassified
createMenuBox
	^ (self createBox: self class menuBoxImage)
		actionSelector: #offerWindowMenu;
		setBalloonText: 'window menu' translated