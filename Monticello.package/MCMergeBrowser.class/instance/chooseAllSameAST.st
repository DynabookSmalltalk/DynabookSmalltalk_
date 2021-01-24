actions
chooseAllSameAST
	conflicts do: [ :ea |
		ea chooseSameAST ].
	self changed: #text; changed: #list; changed: #canMerge.