selection
selection 
	
	^ self getList
		at: self selectionIndex
		ifAbsent: [nil]