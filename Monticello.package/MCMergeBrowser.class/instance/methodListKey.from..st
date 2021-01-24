menus
methodListKey: aKeystroke from: aListMorph 
	aKeystroke caseOf: {
		[$k] -> [self chooseRemote].
		[$r] -> [self chooseLocal]}
		 otherwise: [super methodListKey: aKeystroke from: aListMorph ]