private
doSendMail

	(SMTPClient openOnHostNamed: self smtpServer port: self smtpServerPort)
		user: self smtpUser;
		password: self smtpPassword;
		login;
		mailFrom: mailMessage from to: (mailMessage to findTokens: ',') text: mailMessage asSendableText.