settings
setUserPassword

	UserPassword ifNil: [UserPassword := ''].
	(UIManager default
			requestPassword: 'What is your server passwort?' withCRs)
		ifNotNil: [:answer | UserPassword := answer]