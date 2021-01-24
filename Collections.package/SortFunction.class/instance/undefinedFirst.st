converting
undefinedFirst
	"Return a new SortFunction that sort all the nil first, an non nil with myself."
	^(UndefinedSortFunction on: self) undefinedFirst