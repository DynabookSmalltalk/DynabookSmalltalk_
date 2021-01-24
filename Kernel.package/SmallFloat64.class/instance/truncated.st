truncation and round off
truncated
	"Answer with a SmallInteger equal to the value of the receiver without 
	its fractional part. The primitive fails if the truncated value cannot be 
	represented as a SmallInteger. In that case, the code below will compute 
	a LargeInteger truncated value.
	Essential. See Object documentation whatIsAPrimitive. "

	<primitive: 551>
	"Since SmallInteger maxVal highBit >= Float precision, in 64bits image/VM,
	 every Float with ulp < 1 - that is which may have a fractionPart - fits in a SmallInteger.
	 Thus only care of Float with ulp >= 1 which have Integer value."
	^ self asTrueFraction
		

		