dependents
addDependent: anObject 
	self strongDependents add: anObject.
	super addDependent: anObject