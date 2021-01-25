networking
pruneDeadConnections
	| deadConnections |
	deadConnections := clients select: [ :client | client isConnected not ].
	deadConnections do: [ :client |
		world removeRemoteClient: client].

	deadConnections isEmpty ifTrue:[ ^self ].

	clients removeAll: deadConnections.
	self changed: #numClients.