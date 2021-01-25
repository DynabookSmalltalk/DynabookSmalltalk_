resolving objects
proxyFor: aRemoteObjectID 
	"answer a proxy for aRemoteObjectID"
	| proxy |
	proxiesMutex
		critical: [""proxy _ proxies
						at: aRemoteObjectID
						ifAbsent: [].
			"nil means 2 possible things:  
			1) we never creates a proxy for this RemoteObjectID.  
			2) we created a proxy, but the weak reference forget it"
			proxy isNil
				ifTrue: [""
					proxy _ RSTRemoteObjectProxy remoteObjectID: aRemoteObjectID.
					proxies at: aRemoteObjectID put: proxy]].
	^ proxy