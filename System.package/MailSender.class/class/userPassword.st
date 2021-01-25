accessing
userPassword

	self isUserPasswordSet ifFalse: [self setUserPassword].

	UserPassword isEmpty ifTrue: [ self error: 'no user name specified' ].

	^ UserPassword