networking
stopListening
	listenQueue ifNil: [ ^self ].
	listenQueue destroy.
	listenQueue := nil.