initialization
initializeToStandAlone
	"Initialize the receiver so that it can live as a stand-alone morph"

	| buttonPane aBin aColor tabsPane |
	self basicInitialize.
	
	self
		layoutInset: 0;
		useRoundedCorners;
		hResizing: #rigid;
		vResizing: #shrinkWrap;
		extent: RealEstateAgent standardSize;
		listDirection: #topToBottom;
		wrapDirection: #none.

	"mode buttons"
	buttonPane := self paneForTabs: self modeTabs.
	buttonPane color: self baseBackgroundColor.
	buttonPane
		vResizing: #shrinkWrap;
		setNameTo: 'ButtonPane';
		addMorphFront: self dismissButton;
		addMorphBack: self helpButton;
		color: (aColor := buttonPane color) darker;
		layoutInset: 5;
		width: self width;
		layoutChanged; fullBounds.

	"Place holder for a tabs or text pane"
	tabsPane := Morph new.
	tabsPane
		color: self baseBackgroundColor;
		setNameTo: 'TabPane';
		hResizing: #spaceFill;
		vResizing: #shrinkWrap.

	aBin := (PartsBin newPartsBinWithOrientation: #leftToRight from: #())
		changeTableLayout;
		listDirection: #leftToRight;
		wrapDirection: #topToBottom;
		vResizing: #shrinkWrap;
		color: aColor lighter lighter;
		borderColor: aColor lighter lighter;
		setNameTo: 'Parts';
		dropEnabled: false;
		yourself.
		
	self addMorphBack: buttonPane.
	self addMorphBack: tabsPane.
	self addMorphBack: aBin.
	
	self
		borderWidth: 1;
		borderColor: self baseBorderColor;
		color: self baseBackgroundColor;
		setNameTo: 'Objects' translated;
		showCategories.