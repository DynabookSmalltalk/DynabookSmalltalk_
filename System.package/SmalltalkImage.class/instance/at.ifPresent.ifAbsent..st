accessing
at: key ifPresent: aBlock ifAbsent: anotherBlock
	"Lookup the given key in the globals. If it is present, answer the value of evaluating the given block with the value associated with the key. Otherwise, evaluate anotherBlock and answer its result."
	
	^globals at: key ifPresent: aBlock ifAbsent: anotherBlock