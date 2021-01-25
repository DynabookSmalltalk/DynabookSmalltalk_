event handling
processEvents
	| |
	eventDecoder processIO.
	eventDecoder applyMessagesTo: self.
