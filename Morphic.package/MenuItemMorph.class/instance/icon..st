accessing
icon: aFormOrNil

	icon := aFormOrNil
		ifNotNil: [:form | form scaleIconToDisplay].
	self height: self minHeight.
	self width: self minWidth.