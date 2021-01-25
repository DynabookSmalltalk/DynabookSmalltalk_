accessing
userEmail
	"Answer the user name to be used for sending out messages."

	self isUserEmailSet ifFalse: [self setUserEmail].

	UserEmail isEmpty ifTrue: [ self error: 'no user email specified' ].

	^UserEmail