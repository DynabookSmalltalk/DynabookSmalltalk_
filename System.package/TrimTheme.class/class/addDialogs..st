instance creation
addDialogs: theme
	"self create apply."
	
	theme
		set: #borderColor for: #DialogWindow to: self gray59;
		set: #borderWidth for: #DialogWindow to: 0;
		set: #borderStyle for: #DialogWindow to: BorderStyle simple;
		set: #color for: #DialogWindow to: self gray64;

		set: #titleBorderColor for: #DialogWindow to: self gray59;
		set: #titleBorderWidth for: #DialogWindow to: 0;
		set: #titleBorderStyle for: #DialogWindow to: BorderStyle simple;
		set: #titleColor for: #DialogWindow to: self gray51;
		set: #titleTextColor for: #DialogWindow to: self white;
		
		set: #textColor for: #DialogWindow to: self white;
		
		set: #okColor for: #DialogWindow to: self green;
		set: #cancelColor for: #DialogWindow to: self red;
		set: #buttonColor for: #DialogWindow to: self gray59;
		set: #selectionModifier for: #DialogWindow to: [ [:c | self blue ] ].
	
	"The List Chooser is a dialog, too."
	theme
		set: #addColor for: #ListChooser to: self yellow;
		set: #disabledColor for: #ListChooser to: Color transparent.

		
	"And the system progress bar."
	theme		
		set: #borderColor for: #SystemProgressBarMorph to: Color transparent;
		set: #borderWidth for: #SystemProgressBarMorph to: 0;
		set: #borderStyle for: #SystemProgressBarMorph to: BorderStyle simple;
		set: #color for: #SystemProgressBarMorph to: self gray64;
		set: #barColor for: #SystemProgressBarMorph to: self blue.
		
	"And the balloon morphs."
	theme
		set: #borderColor for: #NewBalloonMorph to: self gray168;
		set: #borderWidth for: #NewBalloonMorph to: 1;
		set: #color for: #NewBalloonMorph to: self gray102;
		set: #textColor for: #NewBalloonMorph to: self white.