selection
selection 
	"Collect the selected row from all columns as array."
		
	^ self getList collect: [:column |
		column
			at: self selectionIndex
			ifAbsent: [nil]]