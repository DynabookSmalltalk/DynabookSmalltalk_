filtering
filterListItem: anObject matching: aPattern
	
	^ anObject asString
		findString: aPattern
		startingAt: 1
		caseSensitive: false