accessing
messageText
	^ super messageText
		ifEmpty: [messageText := code]