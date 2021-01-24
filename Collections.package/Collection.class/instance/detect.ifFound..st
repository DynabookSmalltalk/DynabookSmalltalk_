enumerating
detect: aBlock ifFound: foundBlock
	"Evaluate aBlock with each of the receiver's elements as the argument.  
	Answer the first element for which aBlock evaluates to true. If there is
	no such element, return nil."
	
	^ self 
		detect: aBlock
		ifFound: foundBlock
		ifNone: nil