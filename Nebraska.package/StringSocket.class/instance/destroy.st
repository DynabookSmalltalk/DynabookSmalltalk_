as yet unclassified
destroy

	socketWriterProcess ifNotNil: [socketWriterProcess terminate. socketWriterProcess := nil].
	outputQueue := nil.
	bytesInOutputQueue := 0.
	socket ifNotNil: [socket destroy. socket := nil.].
