browse
debugAction

	(Process
		forBlock: [self doButtonAction]
		runUntil: [:context | context selector = self selector])
			debugWithTitle: ('Debug menu action "{1}" in model "{2}"' format: {self contents. self target printString}).