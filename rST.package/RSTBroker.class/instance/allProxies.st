resolving objects
allProxies
	"anser a collection with all proxies"
	| allProxies |
	proxiesMutex
		critical: [""
			allProxies _ proxies values
						reject: [:each | each isNil]].
	^ allProxies