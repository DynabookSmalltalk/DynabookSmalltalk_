compiling
createCompiledMethod
	| notification |
	[methodAndNode := myClass
		compile: text asString
		environment: Environment current
		notifying: requestor
		trailer: (myClass defaultMethodTrailerIfLogSource: logSource) 
		ifFail: [^nil]]
			on: SyntaxErrorNotification do: [:exc |
				notification := exc.
				exc pass].
	notification ifNotNil: [notification newSource ifNotNil: [:newSource | text := newSource]].
	selector := methodAndNode selector.
	compiledMethod := methodAndNode method.
	self writeSourceToLog.
	priorMethodOrNil := myClass compiledMethodAt: selector ifAbsent: [nil].
