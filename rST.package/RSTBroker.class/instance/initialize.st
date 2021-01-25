initialization
initialize
	Socket initializeNetwork.
	brokerID _ NetNameResolver localAddressString , ':' , port asString.

	" 
	initialize client side"
	proxies _ WeakValueDictionary new.
	proxiesMutex _ Semaphore forMutualExclusion.
	lastRemoteBrokers _ #().
	" 
	initialize server side"
	exportedObjects _ WeakKeyManager new.
	exportedObjects
		onNewKey: [:object :key | " 
			new exported objects will live some time, so the other images  
			can send me a notification"
			rememberer
				remember: object
				forSeconds: 6 * 60 * 60
				naming: brokerID].
	rememberer _ RSTRememberer new.
	""
	self startNetwork