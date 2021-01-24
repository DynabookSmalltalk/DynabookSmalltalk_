mathematical functions
log2
	"Answer the base 2 logarithm of the receiver.
	Arrange to answer exact result in case of exact power of 2."

	^ self significand ln / Ln2 + self exponent