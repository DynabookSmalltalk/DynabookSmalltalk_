accessing
smtpServerPort
	"Answer the server for sending email"

	self isSmtpServerPortSet ifFalse: [self setSmtpServerPort].
	SmtpServerPort isNil ifTrue: [ self error: 'no SMTP server port specified' ].

	^SmtpServerPort