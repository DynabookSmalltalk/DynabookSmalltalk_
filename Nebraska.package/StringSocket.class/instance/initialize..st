as yet unclassified
initialize: aSocket

	transmissionError := false.
	super initialize: aSocket.
	outputQueue := SharedQueue new.
	extraUnsentBytes := bytesInOutputQueue := 0.
	socketWriterProcess := [
		[self transmitQueueNext] whileTrue.
		socketWriterProcess := nil.
		outputQueue := nil.
		bytesInOutputQueue := 0.
	] forkAt: Processor lowIOPriority.