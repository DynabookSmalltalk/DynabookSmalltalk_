instance creation
signalForContext: context message: messageString explanation: explanationString

	 | message |
	message := context method reference, ' has been deprecated', messageString, '.'.
	explanationString ifNotEmpty: [message := message, ' ', explanationString].
	self signal: message.