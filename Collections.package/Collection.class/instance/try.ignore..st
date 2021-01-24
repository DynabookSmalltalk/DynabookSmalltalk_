enumerating
try: aBlock ignore: exceptionOrExceptionSet
	"Evaluate aBlock with each of the receiver's elements as the argument. On error, skip that element and continue."

	^ self
		try: aBlock
		ignore: exceptionOrExceptionSet
		ifException: nil