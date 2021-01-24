filtering
highlightNextColumn

	| i currentColumn nextColumn |
	i := self filterColumnIndex.
	i = 0 ifTrue: [self listMorphs do: [:m | m showFilter: false]].

	currentColumn := self listMorphs at: (i max: 1).
	nextColumn := self listMorphs at: i \\ self listMorphs size + 1.
	
	currentColumn
		showFilter: false;
		backgroundColor: nil.
		
	nextColumn
		showFilter: true;
		backgroundColor: self filterColumnColor.