event handling
mouseEnter: evt
	evt hand newKeyboardFocus: self.
	evt hand needsToBeDrawn ifTrue:[Cursor blank show].