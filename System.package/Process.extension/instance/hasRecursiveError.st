*System-debugging support
hasRecursiveError

	^ self environmentAt: #errorRecursionFlag ifAbsent: [false]