events-processing
handleMouseDown: anEvent
	anEvent wasHandled ifTrue:[^self].
	anEvent hand removePendingBalloonFor: self.
	anEvent hand removePendingHaloFor: self.
	anEvent wasHandled: true.
	anEvent hand newMouseFocus: self event: anEvent.
	anEvent hand removeHaloFromClick: anEvent on: self.
	self sendEventAsIs: anEvent.