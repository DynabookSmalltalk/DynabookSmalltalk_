testing
assignmentCheck: encoder at: location
	^((self isBlockArg and: [Scanner allowBlockArgumentAssignment not])
	    or: [self isMethodArg])
			ifTrue: [location]
			ifFalse: [-1]