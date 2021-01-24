enumerating
detect: aBlock ifFound: foundBlock ifNone: exceptionBlock 
	"Evaluate aBlock with each of the receiver's elements as the argument.
	If there is any element for which aBlock evaluates to true, then evaluate
	foundBlock with that element and answer the result of that foundBlock.
	If aBlock does never evaluate to true, evaluate exceptionBlock, which
	may or may not raise an error."
	
	self do: [:each | (aBlock value: each) ifTrue: [^ foundBlock value: each]].
	^ exceptionBlock value
