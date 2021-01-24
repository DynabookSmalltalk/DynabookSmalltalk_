bit manipulation
hashMultiply
	"This is a multiplication by by 1664525 mod 2^28 written to avoid overflowing into large integers.
	 The primitive is able to perform the operation with modulo arihmetic."
	<primitive: 159>
	"Truncate to 28 bits and try again"
	^(self bitAnd: 16rFFFFFFF) hashMultiply