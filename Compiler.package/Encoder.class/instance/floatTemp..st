temps
floatTemp: node
	(node == (scopeTable at: node name ifAbsent: [])
	 and: [node isTemp
	 and: [node index = (nTemps - 1)]]) ifFalse:
		[self error: 'can only float the last allocated temp var'].
	nTemps := nTemps - 1