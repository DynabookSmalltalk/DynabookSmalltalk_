initialization
initialize
	lastKey _ 0.
	mutex _ Semaphore forMutualExclusion.
	self initializeDictionary.
	onNewKey _ nil