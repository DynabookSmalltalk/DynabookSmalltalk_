drawing
disablePageBreaksWhile: aBlock

	| save result |

	save := showPageBreaks.
	showPageBreaks := false.
	result := aBlock value.
	showPageBreaks := save.
	^result
