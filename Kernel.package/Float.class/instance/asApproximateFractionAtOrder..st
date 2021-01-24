converting
asApproximateFractionAtOrder: maxOrder
	"Answer a Fraction approximating the receiver. This conversion uses the 
	continued fraction method to approximate a floating point number. If maxOrder
	is zero, use maximum order"

	^self 
		asApproximateFractionAtOrder: maxOrder
		precision: self ulp / 2