filtering
filterList: columns matching: aPattern
	"A matching row has a match in at least one column."
	
	| frontMatching substringMatching rowCount columnCount tmp |
	aPattern ifEmpty: [^ columns].
	columns ifEmpty: [^ columns].
	
	"Enable column-specific filtering."
	self filterColumnIndex in: [:index |
		index > 0 ifTrue: [^ self filterList: columns columnIndex: index matching: aPattern]].
	
	rowCount := columns first size.
	rowCount = 0 ifTrue: [^ columns].
	columnCount := columns size.
	
	frontMatching := Array new: columnCount.
	1 to: columnCount do: [:c | frontMatching at: c put: OrderedCollection new].
	substringMatching := Array new: columnCount.
	1 to: columnCount do: [:c | substringMatching at: c put: OrderedCollection new].
	
	modelToView := Dictionary new.
	viewToModel := Dictionary new.
	tmp := OrderedCollection new.
	
	1 to: rowCount do: [:rowIndex |
		| match foundPos |
		match := false.
		foundPos := 0.
		1 to: columnCount do: [:colIndex |
			match := match or: [(foundPos := (self
									filterListItem: ((columns at: colIndex) at: rowIndex)
									matching: aPattern)+colIndex) > colIndex]].
		match & (foundPos = 2) "means front match in first column"
			ifTrue: [
				1 to: columnCount do: [:colIndex |
					(frontMatching at: colIndex) add: ((columns at: colIndex) at: rowIndex)].
				modelToView at: rowIndex put: frontMatching first size.
				viewToModel at: frontMatching first size put: rowIndex]
			ifFalse: [match ifTrue: [
				1 to: columnCount do: [:colIndex |
					(substringMatching at: colIndex) add: ((columns at: colIndex) at: rowIndex)].
				tmp add: rowIndex; add: substringMatching first size]]
	].
	
	tmp pairsDo: [:modelIndex :viewIndex |
		modelToView at: modelIndex put: viewIndex + frontMatching first size.
		viewToModel at: viewIndex + frontMatching first size put: modelIndex].

	^ (1 to: columnCount) collect: [:colIndex |
		(frontMatching at: colIndex), (substringMatching at: colIndex)]













