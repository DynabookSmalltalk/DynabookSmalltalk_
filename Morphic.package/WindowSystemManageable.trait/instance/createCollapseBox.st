as yet unclassified
createCollapseBox
	^ (self createBox: self class collapseBoxImage)
		actionSelector: #collapseOrExpand;
		setBalloonText: 'collapse this window' translated.
