accumulator ops
<< anInteger
	"Unsigned left shift."

	| bitCount |
	bitCount := anInteger.
	bitCount >= 32 ifTrue: [
		hi := low := 0.
		^self ].
	bitCount >= 16 ifTrue: [
		hi := low.
		low := 0.
		bitCount := bitCount - 16 ].
	bitCount >= 15 ifTrue: [
		hi := ((hi bitAnd: 1) bitShift: 15) bitOr: (low bitShift: -1).
		low := (low bitAnd: 1) bitShift: 15.
		^self ].
	bitCount >= 1 ifTrue: [
		hi := ((hi bitShift: bitCount) bitAnd: 16rFFFF) bitOr: (low bitShift: bitCount - 16).
		low := (low bitShift: bitCount) bitAnd: 16rFFFF ]