shutting down
disconnect
	connection ifNotNil: [ connection destroy ].
	eventEncoder := connection := decoder := nil.