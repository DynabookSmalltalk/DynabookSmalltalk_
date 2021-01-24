debug and other
debugGetList

	(Process
		forBlock: [model perform: getListSelector]
		runUntil: [:context | context selector = getListSelector])
			debugWithTitle: ('Debug get-list invocation in model "{1}"' format: {model printString}).