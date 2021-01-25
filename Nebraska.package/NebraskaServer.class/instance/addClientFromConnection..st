networking
addClientFromConnection: connection
	| client |

	client := NebraskaClient onConnection: connection.
	clients add: client.
	client extent: world extent  depth: worldDepth.
	world addRemoteClient: client.
	self changed: #numClients.