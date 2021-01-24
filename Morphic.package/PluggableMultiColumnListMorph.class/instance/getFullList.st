model access - cached
getFullList
	"The full list arranges all items column-first."
	
	fullList ifNotNil: [^ fullList].
	
	fullList := getListSelector
		ifNotNil: [:selector | "A) Fetch the list column-first from the model."
			model perform: selector]
		ifNil: [
			(getListSizeSelector notNil and: [getListElementSelector notNil])
				ifFalse: ["X) We cannot fetch the list from the model. Make it empty."
					#()]
				ifTrue: [ "B) Fetch the list row-first from the model:" 
					| listSize |
					listSize := self getListSize.
					listSize = 0 ifTrue: [#() "Empty list"] ifFalse: [
						| firstRow columns |
						firstRow := self getListItem: 1.
						columns := Array new: firstRow size.
						1 to: columns size do: [:columnIndex |
							"Initialize all columns."
							columns at: columnIndex put: (Array new: listSize).
							"Put the first row in."
							(columns at: columnIndex) at: 1 put: (firstRow at: columnIndex)].
						"Put all other rows in."
						2 to: listSize do: [:rowIndex | (self getListItem: rowIndex)
							doWithIndex: [:item :columnIndex |
								(columns at: columnIndex) at: rowIndex put: item]].
						columns]]].

	self updateColumns.
	
	^ fullList