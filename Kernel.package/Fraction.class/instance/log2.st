mathematical functions
log2
	"This function is defined because super log2 might overflow."
	| res |
	self <= 0 ifTrue: [DomainError signal: 'log2 is only defined for x > 0'].
	"Test self < 1 before converting to float in order to avoid precision loss due to gradual underflow."
	numerator < denominator ifTrue: [^self reciprocal log2 negated].
	res := super log2.
	res isFinite ifTrue: [^res].
	^numerator log2 - denominator log2