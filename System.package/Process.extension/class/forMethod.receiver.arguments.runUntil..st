*System-debugging
forMethod: aCompiledMethod receiver: anObject arguments: someArguments runUntil: aConditionBlock

	^ self
		forBlock: [aCompiledMethod valueWithReceiver: anObject arguments: someArguments]
		runUntil: aConditionBlock