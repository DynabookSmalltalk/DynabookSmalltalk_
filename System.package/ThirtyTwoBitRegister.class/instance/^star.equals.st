accumulator ops
*= aThirtTwoBitRegister
	"Replace my contents with the product of the given register and my current contents."

	| otherLow otherHi mul newLow newHi |
	otherLow := aThirtTwoBitRegister low.
	otherHi := aThirtTwoBitRegister hi.
	"Multiply low with otherLow. Process the two highest bits of low separately if necessary to avoid LargeInteger operations."
	(low bitShift: -8) * (otherLow bitShift: -8) > 16r3FFF
		ifTrue: [ 
			mul := (low bitAnd: 16r3FFF) * otherLow. "Without the two most significant bits of low."
			newLow := (mul bitAnd: 16rFFFF).
			newHi := (mul bitShift: -16).
			mul := (low bitShift: -14) * otherLow. "The two most significant bits of low"
			newLow := newLow + ((mul bitAnd: 16r3) bitShift: 14).
			newHi := newHi + (mul bitShift: -2) + (newLow bitShift: -16) "Carry from newLow" ]
		ifFalse: [
			newLow := low * otherLow. "We'll trim newLow at the end of the method."
			newHi := newLow bitShift: -16 ].
	"Multiply hi with otherLow."
	(hi bitShift: -8) * (otherLow bitShift: -8) > 16r3FFF
		ifTrue: [
			newHi := newHi + 
				((hi bitAnd: 16r3FFF) * otherLow bitAnd: 16rFFFF) +
				(((hi bitShift: -14) * otherLow bitAnd: 16r3) bitShift: 14) ]
		ifFalse: [ newHi := newHi + (hi * otherLow bitAnd: 16rFFFF) ].
	"Multiply low with otherHi."
	(low bitShift: -8) * (otherHi bitShift: -8) > 16r3FFF
		ifTrue: [
			newHi := newHi + 
				((low bitAnd: 16r3FFF) * otherHi bitAnd: 16rFFFF) +
				(((low bitShift: -14) * otherHi bitAnd: 16r3) bitShift: 14) ]
		ifFalse: [ newHi := newHi + (low * otherHi bitAnd: 16rFFFF) ].
	"Truncate and store the results."
	hi := newHi bitAnd: 16rFFFF.
	low := newLow bitAnd: 16rFFFF 
