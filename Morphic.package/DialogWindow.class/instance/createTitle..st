initialization
createTitle: aString 
	"Mimick behavior of MenuMorph title creation."
	
	| box closeButton menuButton |
	box := Morph new
		name: #title;
		changeTableLayout;
		listDirection: #leftToRight;
		yourself.
	
	titleMorph := aString asText asMorph lock.

	closeButton := SystemWindowButton new
		color: Color transparent;
		target: self;
		extent: 12@12;
		actionSelector: #cancelDialog;
		balloonText: 'Cancel this dialog' translated;
		borderWidth: 0;
		visible: self class includeCloseButton;
		yourself.
	SystemWindow closeBoxImage scaleIconToDisplay in: [:icon |
		closeButton labelGraphic: icon; extent: icon extent].

	menuButton := SystemWindowButton new
		color: Color transparent;
		target: self;
		actionSelector: #offerDialogMenu;
		balloonText: 'Dialog menu' translated;
		borderWidth: 0;
		visible: self class includeControlMenu;
		yourself.
	SystemWindow menuBoxImage scaleIconToDisplay in: [:icon |
		menuButton labelGraphic: icon; extent: icon extent].
	
	box addAllMorphs: {closeButton. titleMorph. menuButton}.
	
	self addMorphBack: box.
	self setTitleParameters.