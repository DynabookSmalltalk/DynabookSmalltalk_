settings
setSmtpServerPort
	"Set the SMTP server port used to send outgoing messages via"
	SmtpServerPort ifNil: [SmtpServerPort := 25].
	SmtpServerPort := (UIManager default
		request: 'What is your mail server port for outgoing mail?'
		initialAnswer: SmtpServerPort asString) asNumber.
