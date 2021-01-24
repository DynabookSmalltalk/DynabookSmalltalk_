scanning
next
	| c |
	stream skipSeparators.
	(c := stream peek) == $# ifTrue: [c := stream next; peek].
	c == $' ifTrue: [^ self nextString].
	c == $( ifTrue: [^ self nextArray].
	c isAlphaNumeric ifTrue: [^ self nextSymbol].
	self error: 'Unknown token type'