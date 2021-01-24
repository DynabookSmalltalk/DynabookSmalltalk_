enumerating
try: aBlock ignore: exceptionOrExceptionSet logged: aBoolean
	"Evaluate aBlock with each of the receiver's elements as the argument. On error, skip that element and continue."

	^ self
		try: aBlock
		ignore: exceptionOrExceptionSet
		ifException: (aBoolean ifTrue: [[:err| Transcript showln: err messageText]])