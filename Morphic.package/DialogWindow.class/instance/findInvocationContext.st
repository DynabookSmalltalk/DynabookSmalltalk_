running
findInvocationContext

	| context |
	context := thisContext.
	[context method selector = #getUserResponse and: [context isMethodContext]]
		whileFalse: [context := context sender].
	^ context