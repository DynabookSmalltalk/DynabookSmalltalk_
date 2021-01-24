instance creation
property: selectorOrOneArgBlock collatedWith: aSortFunction
	^self new 
		property: selectorOrOneArgBlock;
		baseSortFunction: aSortFunction