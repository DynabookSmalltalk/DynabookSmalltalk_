Multilingual-ImmPlugin
preferredKeyboardBounds

	self flag: #ImmPlugin.
	^ self bounds: self bounds in: self world.
