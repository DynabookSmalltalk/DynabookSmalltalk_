debug menu
debugAction

	(Process
		forBlock: [self performAction]
		runUntil: [:context | context selector = self actionSelector])
			debugWithTitle: ('Debug button action "{1}" in model "{2}"' format: {self label. self target printString}).