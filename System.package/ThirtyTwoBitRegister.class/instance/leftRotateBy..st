accumulator ops
leftRotateBy: bits
	"Rotate my contents left by the given number of bits, retaining exactly 32 bits."
	"Details: Perform this operation with no LargeInteger arithmetic."

	| bitCount newHi |
	bitCount := bits.
	bitCount >= 32 ifTrue: [ bitCount := bitCount \\ 32 ].
	bitCount >= 16 ifTrue: [
		newHi := low.
		low := hi.
		hi := newHi.
		bitCount := bitCount - 16 ].
	bitCount >= 15 ifTrue: [
		newHi := ((hi bitAnd: 16r1) bitShift: 15) bitOr: (low bitShift: -1).
		low := ((low bitAnd: 16r1) bitShift: 15) bitOr: (hi bitShift: -1).
		hi := newHi.
		^self ].
	bitCount >= 1 ifTrue: [
		| shift |
		shift := bitCount - 16.
		newHi := ((hi bitShift: bitCount) bitAnd: 16rFFFF) bitOr: (low bitShift: shift).
		low := ((low bitShift: bitCount) bitAnd: 16rFFFF) bitOr: (hi bitShift: shift).
		hi := newHi ]