visual properties
updateVisualState: evt
	
	(self containsPoint: evt cursorPoint)
		ifTrue: [
			oldColor ifNotNil: [self color: (oldColor mixed: 1/2 with: Color white)].
			self borderStyle style = #raised ifTrue: [self borderInset]]
		ifFalse: [
			oldColor ifNotNil: [self color: oldColor].
			self borderStyle style = #inset ifTrue: [self borderRaised]].
