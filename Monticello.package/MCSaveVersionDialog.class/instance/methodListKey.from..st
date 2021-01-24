menus
methodListKey: aKeystroke from: aListMorph 
	aKeystroke caseOf: {
		[$I] -> [self ignoreSelection].
		[$e] -> [self refresh].
	} otherwise: [super methodListKey: aKeystroke from: aListMorph ]