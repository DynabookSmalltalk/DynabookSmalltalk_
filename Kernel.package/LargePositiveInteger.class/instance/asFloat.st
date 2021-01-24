converting
asFloat
	"Answer a Float that best approximates the value of the receiver.
	This algorithm is optimized to process only the significant digits of a LargeInteger.
	And it does honour IEEE 754 round to nearest even mode in case of excess precision (see details below)."
	
	"How numbers are rounded in IEEE 754 default rounding mode:
	A shift is applied so that the highest 53 bits are placed before the floating point to form a significand.
	The trailing bits form the fraction part placed after the floating point.
	This fractional number must be rounded to the nearest integer.
	If fraction part is 2r0.1, exactly between two consecutive integers, there is a tie.
	The nearest even integer is chosen in this case.
	Examples (First 52bits of significand are omitted for brevity):
	2r0.00001 is rounded downward to 2r0
	2r1.00001 is rounded downward to 2r1
	2r0.1 is a tie and rounded to 2r0 (nearest even)
	2r1.1 is a tie and rounded to 2r10 (nearest even)
	2r0.10001 is rounded upward to 2r1
	2r1.10001 is rounded upward to 2r10
	Thus, if the next bit after floating point is 0, the significand is left unchanged.
	If next bit after floating point is 1, an odd significand is always rounded upper.
	An even significand is rounded upper only if the fraction part is not a tie."
	
	"Algorihm details:
	The floating point hardware can perform the rounding correctly with several excess bits as long as there is a single inexact operation.
	Note 1: the inexact flag in floating point hardware must not be trusted because in some cases the operations would be exact but would not take into account some bits that were truncated before the Floating point operations.
	Note 2: the floating point hardware is presumed configured in default rounding mode."
	
	| significand shift excess |

	"Check how many bits excess the maximum precision of a Float significand."
	excess := self highBitOfMagnitude - Float precision.
	excess > 7
		ifFalse:
			["We can use naive digit by digit conversion because there will be a single inexact round off at last iteration.
			But the nice thing is that Float precision + 7 excess bits = 60 which fit in a SmallInteger in Spur64.
			So the best to do is to delegate this final operation"
			^self digitsAsFloat ].

	"Remove the excess bits but seven."
	significand := self bitShiftMagnitude: 7 - excess.
	shift := excess - 7.
	"An even significand with a single excess bit immediately following would be truncated.
	But this would not be correct if above shift has truncated some extra bits.
	Check this case, and move an extra bit to the last significand digit."
	((significand digitAt: 1) = 2r01000000 and: [self anyBitOfMagnitudeFrom: 1 to: shift])
		ifTrue: [significand := significand + self sign].

	^significand digitsAsFloat timesTwoPower: shift.