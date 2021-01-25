event handling
mouseUp: evt

	"if oldColor nil, it signals that mouse had not gone DOWN inside me, e.g. because of a cmd-drag; in this case we want to avoid triggering the action!"

	oldColor ifNil: [^self].
	self color: oldColor.
	(self containsPoint: evt cursorPoint) ifTrue: [
		self label: labelUp.
		self doButtonUpAction.
	].
