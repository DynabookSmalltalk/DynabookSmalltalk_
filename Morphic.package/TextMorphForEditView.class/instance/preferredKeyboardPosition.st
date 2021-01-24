Multilingual-ImmPlugin
preferredKeyboardPosition

	| pos |
	self flag: #ImmPlugin.
	pos := super preferredKeyboardPosition.
	^ pos + (self boundsInWorld) topLeft.
