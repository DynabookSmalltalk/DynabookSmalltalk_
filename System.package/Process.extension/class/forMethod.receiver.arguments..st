*System-debugging
forMethod: aCompiledMethod receiver: anObject arguments: someArguments
	"Create a process and step into the method."
	
	^ self
		forBlock: [aCompiledMethod valueWithReceiver: anObject arguments: someArguments]
		runUntil: [:context | context method == aCompiledMethod]