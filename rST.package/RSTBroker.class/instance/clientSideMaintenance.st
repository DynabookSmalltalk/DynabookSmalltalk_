maintenance
clientSideMaintenance
	"notify to the remote brokers wich proxies are alive"
	| allRemoteObjectID currentRemoteBrokers |
	allRemoteObjectID _ self allProxies
				collect: [:each | each xxxRemoteObjectID].
	currentRemoteBrokers _ (allRemoteObjectID
				collect: [:each | each brokerID]) asSet.
	""
	currentRemoteBrokers
		do: [:remoteImage | 
			| objectsIDs | 
			objectsIDs _ allRemoteObjectID
						select: [:remoteObjectID | remoteObjectID brokerID = remoteImage]
						thenCollect: [:remoteObjectID | remoteObjectID objectID].
			self
				sendExecutor: (RSTLivingReferencesExecutor from: brokerID objectIDs: objectsIDs)
				toBroker: remoteImage].
	""
	(lastRemoteBrokers copyWithoutAll: currentRemoteBrokers)
		do: [:remoteImage | ""
			self
				sendExecutor: (RSTLivingReferencesExecutor from: brokerID objectIDs: #())
				toBroker: remoteImage].
	lastRemoteBrokers _ currentRemoteBrokers