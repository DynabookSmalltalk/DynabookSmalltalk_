as yet unclassified
addToGlobalIncomingQueue: aMorphTuple

	self critical: [
		self globalIncomingQueue add: aMorphTuple.
		self bumpUpdateCounter.
	].