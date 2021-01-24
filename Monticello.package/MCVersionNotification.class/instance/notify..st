notifying
notify: aString
	| message |
	message := self messageTo: aString.
	SMTPClient
		deliverMailFrom: message from
		to: { message to }
		text: message text
		usingServer: MailSender smtpServer