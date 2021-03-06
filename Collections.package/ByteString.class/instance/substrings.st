converting
substrings
	"Answer an array of the substrings that compose the receiver."
	
	^Array streamContents: [ :stream |
		| end start |
		end := 1.
		"find one substring each time through this loop"
		[ "find the beginning of the next substring"
			(start := self 
				indexOfAnyOf: CharacterSet nonSeparators 
				startingAt: end) = 0 ]
			whileFalse: [
				"find the end"
				end := self 
					indexOfAnyOf: CharacterSet separators 
					startingAt: start
					ifAbsent: [ self size + 1 ].
				stream nextPut: (self copyFrom: start to: end - 1) ] ]