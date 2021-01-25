testing
isUserPasswordSet
	^ UserPassword notNil and: [UserPassword notEmpty]
