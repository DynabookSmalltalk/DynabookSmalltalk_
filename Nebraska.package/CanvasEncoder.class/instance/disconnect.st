connection
disconnect
	connection ifNotNil: [
		connection destroy.
		connection := nil.
	].