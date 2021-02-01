buttons
makeButton: aString balloonText: anotherString for: aSymbol

	^ SimpleButtonDelayedMenuMorph new target: self;
		 borderStyle: BorderStyle raised;
		 color: self colorForButtons;
		 label: aString font: self fontForButtons;
		 setBalloonText: anotherString;
		 actionSelector: aSymbol