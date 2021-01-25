as yet unclassified
removeFromGlobalIncomingQueue: theActualObject

	self critical: [
		GlobalIncomingQueue := self globalIncomingQueue reject: [ :each | 
			each second == theActualObject
		].
		self bumpUpdateCounter.
	].