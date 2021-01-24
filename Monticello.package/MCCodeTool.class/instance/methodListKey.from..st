menus
methodListKey: aKeystroke from: aListMorph 
	aKeystroke caseOf: {
		[$b] -> [self browseMethodFull].
		[$h] -> [self classHierarchy].
		[$p] -> [self browseFullProtocol].
		[$o] -> [self fileOutMessage].
		[$c] -> [self copySelector].
		[$C] -> [self copyReference].
		[$n] -> [self browseSendersOfMessages].
		[$m] -> [self browseMessages].
		[$i] -> [self methodHierarchy].
		[$v] -> [self browseVersions]}
		 otherwise: []