list morph callbacks
iconAt: rowIndex column: columnIndex

	getIconSelector ifNil: [^ nil].

	getIconSelector numArgs = 1 ifTrue: [
		"For unspecific icon selectors only icons for the first column."
		^ columnIndex = 1
			ifTrue: [model perform: getIconSelector with: rowIndex]
			ifFalse: [nil]].
	
	^ model
		perform: getIconSelector
		with: (self modelIndexFor: rowIndex)
		with: columnIndex