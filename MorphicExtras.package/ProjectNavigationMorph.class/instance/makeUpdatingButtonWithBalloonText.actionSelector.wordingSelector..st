buttons
makeUpdatingButtonWithBalloonText: balloonString actionSelector: actionSymbol wordingSelector: wordingSymbol
	"Answer a button  whose target is the receiver (i.e. a ProjectNavigationMorph), who gets its wording by sending the wordingSelector to me.  The given string"

	| aButton |
	aButton := UpdatingSimpleButtonMorph new.
	aButton
		target: self;
		borderStyle: BorderStyle raised;
		color: self colorForButtons;
		label: '-' font: self fontForButtons;
		setBalloonText: balloonString translated;
		actionSelector: actionSymbol;
		wordingSelector: wordingSymbol.
	aButton step.
	^ aButton
	
	