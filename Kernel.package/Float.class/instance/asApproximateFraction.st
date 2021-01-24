converting
asApproximateFraction
	"Answer a Fraction approximating the receiver. This conversion uses the 
	continued fraction method to approximate a floating point number."

	^ self asApproximateFractionRelativeDecimalPlaces: 10