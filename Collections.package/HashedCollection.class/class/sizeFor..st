sizing
sizeFor: numberOfElements
	"Return a large enough prime (or odd if too large), the size of the internal array to hold numberOfElements with at most 75% load factor."
	
	^self goodPrimeAtLeast: numberOfElements * 4 + 2 // 3 "Optimized version of (numberOfElements * 4 / 3) ceiling."