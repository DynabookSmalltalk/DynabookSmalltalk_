model access
getCurrentSelectionIndex
	"Answer the index of the current selection. Similar to #selection: but with the full list instead of the (maybe) filtered list."

	getIndexSelector ifNil: [^ 0].
	
	(model perform: getIndexSelector) in: [:row |
		row ifNil: [^ 0].
		row ifEmpty: [^ 0].
		
		1 to: self fullListSize do: [:rowIndex |
			| match |
			match := true.
			self getFullList doWithIndex: [:column :columnIndex |
				match := match and: [(column at: rowIndex) = (row at: columnIndex)]].
			match ifTrue: [^ rowIndex]]].
	
	^ 0