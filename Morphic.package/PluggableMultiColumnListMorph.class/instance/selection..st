selection
selection: someObjects
	
	| found |
	someObjects size ~= self columnCount ifTrue: [^ self].
	
	1 to: self listSize do: [:row |
		found := true.
		self getList doWithIndex: [:items :column |
			found := found and: [(items at: row) = (someObjects at: column)]].
		found ifTrue: [^ self selectionIndex: row]].