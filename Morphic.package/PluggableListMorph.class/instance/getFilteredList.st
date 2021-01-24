model access - cached
getFilteredList
	"Apply the current filter to the list. Maybe shorten the filter term if there are no matches."
	
	| fullList filteredList |
	fullList := self getFullList.
		
	self hasFilter ifFalse: [^ fullList].
	fullList ifEmpty: [^ fullList].
	
	filteredList := self filterList: fullList matching: lastKeystrokes.
	
	(filteredList isEmpty not or: [ self allowEmptyFilterResult ])
		ifFalse: 
			[ "Remove the last character and try filtering again."
			lastKeystrokes := lastKeystrokes allButLast: 1.
			^ self
				 flash;
				 getFilteredList ].
			
	^ filteredList