accessing
cachedDefinitions
	
	^definitions ifNil: [ definitions := WeakIdentityKeyDictionary new ]