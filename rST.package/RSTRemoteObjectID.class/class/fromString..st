instance creation
fromString: aString 
	"creates an instance from aString with the format objectID@brokerID"
	| atPos |
	atPos _ aString indexOf: $@.
	atPos isZero
		ifTrue: [self error: 'invalid format'].
	^ self
		brokerID: (aString allButFirst: atPos)
		objectID: (aString first: atPos - 1)