mathematical functions
nthRootTruncated: n
	"Answer the integer part of the nth root of the receiver."
	| guess guessToTheNthMinusOne nextGuess |
	self = 0 ifTrue: [^0].
	(n isInteger and: [n > 0]) ifFalse: [ ArithmeticError signal: 'nthRootTruncated: operand must be a strictly positive Integer' ].
	self negative
		ifTrue:
			[n even ifTrue: [ ArithmeticError signal: 'Negative numbers don''t have even roots.' ].
			^(self negated nthRootTruncated: n) negated].
	guess := self initialGuessForNthRoot: n.
	[
		guessToTheNthMinusOne := guess raisedToInteger: n - 1.
		nextGuess := (n - 1 * guess * guessToTheNthMinusOne + self) // (guessToTheNthMinusOne * n).
		nextGuess >= guess ] whileFalse:
			[ guess := nextGuess ].
	( guess raisedToInteger: n) > self  ifTrue:
			[ guess := guess - 1 ].
	^guess