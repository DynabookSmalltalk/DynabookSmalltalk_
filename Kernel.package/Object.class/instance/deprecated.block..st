error handling
deprecated: explanationString block: aBlock 
	 "Warn that the sender has been deprecated.  Answer the value of aBlock on resumption.  (Note that #deprecated: is usually the preferred method.)"

	Deprecation
		signalForContext: thisContext sender
		message: ''
		explanation: explanationString.
	^ aBlock value