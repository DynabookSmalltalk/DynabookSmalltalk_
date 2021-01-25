as yet unclassified
removeAllFromGlobalIncomingQueue

	self critical: [
		GlobalIncomingQueue := OrderedCollection new.
		self bumpUpdateCounter.
	].