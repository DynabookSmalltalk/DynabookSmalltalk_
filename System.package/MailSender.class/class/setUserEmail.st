settings
setUserEmail
	"Change the user's email for use in composing messages."

	(UIManager default
			request: 'What is your email address?\(This is the address other people will reply to you)' withCRs
			initialAnswer: (UserEmail ifNil: [UserEmail := '']))
		ifNotNil: [:answer | UserEmail := answer]