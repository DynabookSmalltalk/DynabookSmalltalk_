accumulator ops
>> anInteger
	"Unsigned right shift."

	| bitCount shift |
	bitCount := anInteger.
	bitCount >= 32 ifTrue: [
		hi := low := 0.
		^self ].
	bitCount >= 16 ifTrue: [
		low := hi.
		hi := 0.
		bitCount := bitCount - 16 ].
	bitCount >= 2 ifTrue: [
		shift := 0 - bitCount.
		low := (low bitShift: shift) bitOr: ((hi bitShift: shift + 16) bitAnd: 16rFFFF).
		hi := hi bitShift: shift.
		^self ].
	bitCount >= 1 ifTrue: [
		low := (low bitShift: -1) bitOr: ((hi bitAnd: 16r1) bitShift: 15).
		hi := hi bitShift: -1 ]