private
mapPC: pc in: compiledCode
	"Assuming the word size of compiledCode is 8, and that the pc is one for a word size of 4,
	 map the pc from 4 to 8 byte literals. The filter is in updatePCDependentObjects."
	^pc + (compiledCode numLiterals + 1 * 4)