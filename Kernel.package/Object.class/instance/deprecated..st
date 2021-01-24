error handling
deprecated: explanationString
	"Warn that the sending method has been deprecated."

	Deprecation
		signalForContext: thisContext sender
		message: ''
		explanation: explanationString