bit manipulation
bitCount
	"Count the number of bits set to 1 in self. Overridden for performance"

	| n bitCount |
	self < 0 ifTrue: [self error: 'Cannot count bits of negative integers'].
	bitCount := 0.
	n := self.
	[ n = 0 ] whileFalse: [
		bitCount := bitCount + (BitCountPerByteTable at: (n bitAnd: 16rFF) + 1).
		n := n bitShift: -8 ].
	^bitCount