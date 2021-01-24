converting
undefinedLast
	"Return a new SortFunction that sort all the nil last, an non nil with myself."
	^(UndefinedSortFunction on: self) undefinedLast