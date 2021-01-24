initialization
initialize

	super initialize.
	
	self beSplitsLeftAndRight.
	
	leftOrTop := OrderedCollection new.
	rightOrBottom := OrderedCollection new.
	
	self initializeMovements.