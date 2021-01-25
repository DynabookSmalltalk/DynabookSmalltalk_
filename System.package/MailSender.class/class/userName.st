accessing
userName
	"Answer the user name to be used for sending out messages."

	self isUserNameSet ifFalse: [self setUserName].

	UserName isEmpty ifTrue: [ self error: 'no user name specified' ].

	^UserName