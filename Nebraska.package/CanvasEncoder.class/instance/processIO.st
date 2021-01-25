network
processIO
	connection ifNil: [ ^self ].
	connection isConnected ifFalse: [ ^self ].
	connection processIO.