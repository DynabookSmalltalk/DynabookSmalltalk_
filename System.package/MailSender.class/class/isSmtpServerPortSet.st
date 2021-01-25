testing
isSmtpServerPortSet
	^ SmtpServerPort notNil and: [SmtpServerPort isNumber]
