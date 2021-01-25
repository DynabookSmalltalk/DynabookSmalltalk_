events-processing
handleMouseMove: anEvent
	anEvent wasHandled ifTrue:[^self]. "not interested"
	(anEvent hand hasSubmorphs) ifTrue:[^self].
	(anEvent anyButtonPressed and:[anEvent hand mouseFocus ~~ self]) ifTrue:[^self].
	anEvent wasHandled: true.
	self sendEventAsIs: anEvent.