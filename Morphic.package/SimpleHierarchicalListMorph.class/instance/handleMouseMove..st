events-processing
handleMouseMove: anEvent
	"Reimplemented because we really want #mouseMove when a morph is dragged around"
	anEvent wasHandled ifTrue:[^self]. "not interested"
	self hoveredMorph: (self itemFromPoint: anEvent position).
	(anEvent anyButtonPressed and:[anEvent hand mouseFocus == self]) ifFalse:[^self].
	anEvent wasHandled: true.
	self mouseMove: anEvent.
	(self handlesMouseStillDown: anEvent) ifTrue:[
		"Step at the new location"
		self startStepping: #handleMouseStillDown: 
			at: Time millisecondClockValue
			arguments: {anEvent copy resetHandlerFields}
			stepTime: 1].
