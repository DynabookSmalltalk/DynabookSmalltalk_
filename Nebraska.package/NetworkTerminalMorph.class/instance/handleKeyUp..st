events-processing
handleKeyUp: anEvent
	anEvent wasHandled ifTrue:[^self].
	(self handlesKeyboard: anEvent) ifFalse:[^self].
	anEvent wasHandled: true.
	self sendEventAsIs: anEvent.