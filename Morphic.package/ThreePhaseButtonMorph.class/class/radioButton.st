instance creation
radioButton
	"Answer a button pre-initialized with radiobutton images."
	| f |
	^self new
		onImage: (f := (MenuIcons radioButtonOn dyed: Color black) scaleIconToDisplay);
		pressedImage: (MenuIcons radioButtonPressed dyed: Color black) scaleIconToDisplay;
		offImage: (MenuIcons radioButtonOff dyed: Color black) scaleIconToDisplay;
		extent: f extent + (2@0);
		setDefaultParameters;
		yourself
