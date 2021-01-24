accessing
selectedIcon: aFormOrNil

	selectedIcon := aFormOrNil
		ifNotNil: [:form | form scaleIconToDisplay].