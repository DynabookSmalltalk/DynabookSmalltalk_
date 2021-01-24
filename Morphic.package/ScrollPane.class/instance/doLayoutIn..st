layout
doLayoutIn: layoutBounds
	"Manually layout my submorphs. Maybe we can find a proper layout policy in the future."

	| priorBounds |
	priorBounds := bounds.
	
	self updateLayout.
	super doLayoutIn: layoutBounds.

	"Do one additional run if required."
	(priorBounds ~= bounds or: [self hasProperty: #doLayoutAgainHere]) ifTrue: [
		self updateLayout.
		super doLayoutIn: layoutBounds.
		"self assert: (self hasProperty: #doLayoutAgainHere) not. --- Not working yet."].