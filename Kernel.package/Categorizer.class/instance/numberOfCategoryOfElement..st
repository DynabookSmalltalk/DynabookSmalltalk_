accessing
numberOfCategoryOfElement: element 
	"Answer the index of the category with which the argument, element, is 
	associated."

	| categoryIndex elementIndex elementArraySize |
	categoryIndex := 1.
	elementIndex := 0.
	elementArraySize := elementArray size.
	[(elementIndex := elementIndex + 1) <= elementArraySize]
		whileTrue: 
			["point to correct category"
			[elementIndex > (categoryStops at: categoryIndex)]
				whileTrue: [categoryIndex := categoryIndex + 1].
			"see if this is element"
			element = (elementArray at: elementIndex) ifTrue: [^categoryIndex]].
	^0