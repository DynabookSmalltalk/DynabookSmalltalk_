as yet unclassified
createCloseBox
	^ (self createBox: self class closeBoxImage)
		actionSelector: #delete;
		setBalloonText: 'close this window' translated