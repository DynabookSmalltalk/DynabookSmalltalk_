receiving
awaitDataFor: aCommunicatorMorph

	Socket initializeNetwork.
	connectionQueue := ConnectionQueue 
		portNumber: self class eToyCommunicationsPorts 
		queueLength: 6.
	communicatorMorph := aCommunicatorMorph.
	process := [self doAwaitData] newProcess.
	process priority: Processor highIOPriority.
	process resume.
