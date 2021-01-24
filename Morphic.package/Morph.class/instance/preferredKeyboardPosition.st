Multilingual-ImmPlugin
preferredKeyboardPosition

	self flag: #ImmPlugin.
	^ (self bounds: self bounds in: self world) topLeft.
