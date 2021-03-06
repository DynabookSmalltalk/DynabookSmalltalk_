events-processing
handleFocusEvent: anEvent
	"Handle the given event. This message is sent if the receiver currently has the focus and is therefore receiving events directly from some hand. However, it might already have been handled due to overrides in #processFocusEvent:using:. We might want to get rid of this call-back in the future..."
	
	^ anEvent wasHandled
		ifTrue: [anEvent]
		ifFalse: [self handleEvent: anEvent]