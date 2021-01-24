utilities
chooseFrom: aList values: valueList lines: linesArray title: queryString
	"Choose an item from the given list. Answer the index of the selected item."
	| index |
	index := self chooseFrom: aList lines: linesArray title: queryString.
	^ valueList at: index ifAbsent: [nil]