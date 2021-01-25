private - running
sendGoodbye
	"notify to the remote images that I'll never user the references again"
	| remoteImages |
	remoteImages _ (self allProxies
				collect: [:each | each xxxRemoteObjectID brokerID]) asSet.
	remoteImages addAll: lastRemoteBrokers.
	""
	remoteImages
		do: [:remoteImage | ""
			"TODO: ignore posible errors"
			self
				sendExecutor: (RSTLivingReferencesExecutor from: brokerID objectIDs: #())
				toBroker: remoteImage]