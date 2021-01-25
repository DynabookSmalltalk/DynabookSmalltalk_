events-processing
handleKeystroke: anEvent
	anEvent wasHandled ifTrue:[^self].
	anEvent wasHandled: true.
	self sendEventAsIs: anEvent.