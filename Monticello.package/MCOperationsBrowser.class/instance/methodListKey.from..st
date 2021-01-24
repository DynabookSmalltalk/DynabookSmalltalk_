menus
methodListKey: aKeystroke from: aListMorph
	aKeystroke caseOf: {
		[$x] -> [self revertSelection] } 
	otherwise: [super methodListKey: aKeystroke from: aListMorph ]