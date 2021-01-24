enumerating
timesRepeat: aBlock 
	"Evaluate the argument, aBlock, the number of times represented by the 
	receiver."

	| remaining |
	remaining := self.
	[ (remaining := remaining - 1) >= 0 ] whileTrue: [
		aBlock value ]