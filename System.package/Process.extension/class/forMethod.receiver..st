*System-debugging
forMethod: aCompiledMethod receiver: anObject
	"Create a process and step into the method."
	
	^ self
		forBlock: [aCompiledMethod valueWithReceiver: anObject arguments: {}]
		runUntil: [:context | context method == aCompiledMethod]