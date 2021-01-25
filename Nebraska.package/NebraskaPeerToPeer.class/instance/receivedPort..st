receiving
receivedPort: aString
	(remoteSocketAddress includes: $:) ifFalse: [
		remoteSocketAddress := remoteSocketAddress, ':', aString].