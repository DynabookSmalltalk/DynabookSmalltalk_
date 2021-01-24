menus
classListMenu: aMenu 
	classSelection ifNil: [ ^aMenu ].

	super classListMenu: aMenu.

	aMenu
		addLine;
				add: ('load class {1}' translated format: {classSelection})
				action: #loadClassSelection;
				add: ('load class {1} into other Environment...' translated format: {classSelection})
				action: #loadClassSelectionIntoOtherEnvironment.
	^ aMenu