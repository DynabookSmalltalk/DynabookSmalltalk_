networking
startListeningOnPort: portNumber
	Socket initializeNetwork.
	self stopListening.
	listenQueue := ConnectionQueue portNumber: portNumber  queueLength: 5.