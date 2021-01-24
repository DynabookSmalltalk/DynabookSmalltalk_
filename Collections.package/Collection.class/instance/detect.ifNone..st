enumerating
detect: aBlock ifNone: exceptionBlock 
	"Evaluate aBlock with each of the receiver's elements as the argument.  
	Answer the first element for which aBlock evaluates to true. If there is
	no such element, evaluate exceptionBlock."

	^ self
		detect: aBlock
		ifFound: [:element | element]
		ifNone: exceptionBlock