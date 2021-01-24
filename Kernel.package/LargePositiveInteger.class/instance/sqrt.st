mathematical functions
sqrt
	"Answer the square root of the receiver.
	If the square root is exact, answer an Integer, else answer a Float approximation.
	Make sure the result is correctly rounded (i.e. the nearest Float to the exact square root)"
	
	| floatResult integerResult guardBit highBit sr |
	(highBit := self highBit) < (Float precision * 2)
		ifTrue:
			["the sqrt of self asFloat is correctly rounded, so use it"
			floatResult := self asFloat sqrt.
			self mightBeASquare ifFalse: [^floatResult].
			"Answer integerResult in case of perfect square"
			integerResult := floatResult truncated.
			integerResult squared = self ifTrue: [^integerResult].
			^floatResult].

	"Eventually use a guard bit for handling correct rounding direction"
	guardBit := highBit <= (Float precision + 1 * 2)
		ifTrue:
			["Add one guard bit for rounding correctly"
			1]
		ifFalse:
			[self mightBeASquare
				ifTrue:
					["Keep all the bits in case we are a perfect square"
					0]
				ifFalse:
					["Remove superfluous bit that won't change the Float approximation"
					Float precision + 1 - (highBit // 2)]].
	
	"Get truncated sqrt and remainder for the same price"
	sr := (self bitShift: guardBit * 2) sqrtRem.
	
	"Handle case of perfect square"
	integerResult := sr first.
	sr last isZero ifTrue: [^integerResult bitShift: guardBit negated].
	
	"Answer the best we have which is the sqrt correctly rounded at Float precision."
	^((integerResult bitShift: Float precision - integerResult highBit)
		+ (integerResult bitAt: integerResult highBit - Float precision)) asFloat
			timesTwoPower: integerResult highBit - Float precision - guardBit