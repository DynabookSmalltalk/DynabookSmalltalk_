instance creation
startWith: aSortFunction then: nextSortFunction
	^self new
		baseSortFunction: aSortFunction;
		nextFunction: nextSortFunction