dependents
removeDependent: anObject 
	super removeDependent: anObject.
	self strongDependents
		remove: anObject
		ifAbsent: [].
	self strongDependents isEmpty
		ifTrue: [self clearStrongDependents]