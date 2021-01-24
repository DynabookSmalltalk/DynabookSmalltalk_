enumerating
detect: aBlock 
	"Evaluate aBlock with each of the receiver's elements as the argument. 
	Answer the first element for which aBlock evaluates to true. If there is
	no such element, raise an error."

	^ self
		detect: aBlock
		ifFound: [:element | element]
		ifNone: [self errorNotFound: aBlock]