private - running
stopConnectionHandler
	connectionHandler isNil
		ifFalse: [""
			connectionHandler stop.
			connectionHandler _ nil]