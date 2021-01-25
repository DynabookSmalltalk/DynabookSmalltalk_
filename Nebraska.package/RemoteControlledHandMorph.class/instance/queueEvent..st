events
queueEvent: anEvent
	"add an event to be handled"

	anEvent setHand: self.
	self handleEvent: anEvent resetHandlerFields.