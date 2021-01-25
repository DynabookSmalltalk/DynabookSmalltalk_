connection - client
sendMessage: aMessage to: aRemoteObjectID 
	"send aMessage to aRemoteObjectID"
	| remoteMessage |
	remoteMessage _ RSTRemoteMessage
				message: aMessage
				to: aRemoteObjectID
				using: self.
	^ self sendExecutor: remoteMessage toBroker: aRemoteObjectID brokerID