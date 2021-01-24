converting
asApproximateFractionRelativeDecimalPlaces: decimalPlaces
	"Answer a Fraction approximating the receiver. This conversion uses the 
	continued fraction method to approximate a floating point number.
	Stop the recursion when precision has reached prescribed number of relative decimalPlaces."

	^ self
		asApproximateFractionAtOrder: 0
		precision: (1.0 timesTwoPower: self exponent - (decimalPlaces * Ln10 / Ln2) rounded)