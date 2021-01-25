receiving
stopListening

	process ifNotNil: [process terminate. process := nil].
	connectionQueue ifNotNil: [connectionQueue destroy. connectionQueue := nil].

