private-events
processEvent: evt
	"evt is a raw event buffer from VM. Check for window events (close etc.). Queue events if queue exists"
	(evt at: 1) = EventTypeWindow
		ifTrue: [self processWindowEvent: evt].
	self queueEvent: evt.
