truncation and round off
truncated
	"Answer with a SmallInteger equal to the value of the receiver without 
	its fractional part. The primitive fails if the truncated value cannot be 
	represented as a SmallInteger. In that case, the code below will compute 
	a LargeInteger truncated value.
	Essential. See Object documentation whatIsAPrimitive. "

	<primitive: 51>
	self isFinite ifFalse: [self error: 'Cannot truncate this number'].
	self abs <  4.503599627370496e15
			"Float maxExactInteger/2 =  (1.0 timesTwoPower: Float precision - 1)"
			"Every Float bigger than or equal to that has ulp >= 1, thus no fractionPart"
		ifTrue: ["Fastest way when it may not be an integer"
				"This branch is unreachable in 64 bits image"
				| di df q r |
				di := 1 + (SmallInteger maxVal bitShift: -1).
				df := di asFloat.
				q := self quo: df.
				r := self - (q asFloat * df).
				^q * di + r truncated]
		ifFalse: [^ self asTrueFraction.  "Extract all bits of the significand and shift if necessary"]

		

		