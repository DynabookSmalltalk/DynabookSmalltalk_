instance creation
checkBox
	"Answer a button pre-initialized with checkbox images."
	| f |
	^self new
		onImage: (f := (MenuIcons checkBoxOn dyed: Color red) scaleIconToDisplay);
		pressedImage: (MenuIcons checkBoxPressed dyed: Color black) scaleIconToDisplay;
		offImage: (MenuIcons checkBoxOff dyed: Color black) scaleIconToDisplay;
		extent: f extent + (2@0);
		setDefaultParameters;
		yourself
