*System-debugging support
clearErrorRecursionFlag

	self environmentAt: #errorRecursionFlag put: false.