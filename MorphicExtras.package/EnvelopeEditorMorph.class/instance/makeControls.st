construction
makeControls
	| chooser button row |
	row := AlignmentMorph newRow color: color; borderWidth: 0.
	row align: row bounds topLeft with: graphArea bounds bottomLeft + (0@5).
	button := SimpleButtonMorph new target: self; borderColor: Color black;
			borderWidth: 2; color: color.
	row addMorphBack: (button label: 'Menu' translated; actWhen: #buttonDown;
												actionSelector: #invokeMenu).
	row addMorphBack: (Morph new extent:10@1; color: Color transparent).
	chooser := PopUpChoiceMorph new extent: 120@14;
		contentsClipped: 'Editing: ' , envelope name;
		target: self;
		actionSelector: #chooseFrom:envelopeItem:;
		getItemsSelector: #curveChoices.
	chooser arguments: (Array with: chooser).
	row addMorphBack: chooser.
	
	chooser := PopUpChoiceMorph new extent: 130@14;
		contentsClipped: 'Timbre: ' , soundName;
		target: self;
		actionSelector: #chooseFrom:soundItem:;
		getItemsSelector: #soundChoices.
	chooser arguments: (Array with: chooser).
	row addMorphBack: chooser.
	
	^row