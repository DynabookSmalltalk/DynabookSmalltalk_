events-processing
handleMouseUp: anEvent
	anEvent wasHandled ifTrue:[^self]. "not interested"
	anEvent hand mouseFocus == self ifFalse:[^self]. "Not interested in other parties"
	anEvent hand releaseMouseFocus: self.
	anEvent wasHandled: true.
	self sendEventAsIs: anEvent.