event handling
mouseMove: evt

	evt redButtonPressed ifFalse: [
		(self enterClickableRegion: evt)
			ifFalse: [self editor updateCursorForEvent: evt].
		^ self].

	self
		handleInteraction: [self editor mouseMove: evt]
		fromEvent: evt.