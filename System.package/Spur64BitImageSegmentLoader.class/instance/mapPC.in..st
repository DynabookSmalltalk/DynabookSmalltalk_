private
mapPC: pc in: compiledCode
	"Assuming the word size of compiledCode is 4, and that the pc is one for a word size of 8,
	 map the pc from 8 to 4 byte literals. The filter is in updatePCDependentObjects."
	^pc - (compiledCode numLiterals + 1 * 4)