mathematical functions
log2
	self > 0 ifTrue: [^super log2].
	^DomainError signal: 'log2 is only defined for x > 0'