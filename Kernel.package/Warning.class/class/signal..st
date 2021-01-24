instance creation
signal: signalerText

	^ self suppressed
		ifTrue: [nil]
		ifFalse: [self new signal: signalerText]