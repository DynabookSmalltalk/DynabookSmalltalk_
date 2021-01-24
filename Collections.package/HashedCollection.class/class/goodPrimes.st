sizing
goodPrimes
	"Answer a sorted array of prime numbers less than one billion that make good hash table sizes. See #initializeGoodPrimes."
	
	^GoodPrimes ifNil: [
		self initializeGoodPrimes.
		GoodPrimes ]