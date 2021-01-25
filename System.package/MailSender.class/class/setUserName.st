settings
setUserName

	(UIManager default
			request: 'What is your user name on the SMTP server?' withCRs
			initialAnswer: (UserName ifNil: [UserName := '']))
		ifNotNil: [:answer | UserName := answer]