running
exploreInvocation

	self exclusive: false.
	(self findInvocationContext stack collect: #method)
		explore