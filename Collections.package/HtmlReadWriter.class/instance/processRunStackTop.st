reading
processRunStackTop
	"Write accumulated attributes to run array."
	
	| currentIndex start attrs |
	currentIndex := count - offset.
	start := runStack top second.
	attrs := runStack top first.
	runArray
		add: attrs asArray
		withOccurrences: currentIndex - start + 1.