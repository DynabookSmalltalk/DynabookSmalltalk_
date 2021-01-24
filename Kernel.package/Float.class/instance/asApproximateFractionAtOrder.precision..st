converting
asApproximateFractionAtOrder: maxOrder precision: limit 
	"Answer a Rational number--Integer or Fraction--representing the receiver.
	This conversion uses the continued fraction method to	approximate a floating point number.
	The iteration stops when precision has reached the prescribed limit,
	or when the maximum number of iterations has been reached.
	If maxOrder is zero, then the number of iterations is not limited."
	
	| num1 denom1 num2 denom2 int frac newD order |
	newD := self asFraction. "use exact arithmetic to avoid both overflow and accumulation of rounding errors"
	num1 := denom2 := 1. "Initialize alternating numerators"
	num2 := denom1 := 0. "and denominators"	
	order := maxOrder = 0 ifTrue: [-1] ifFalse: [maxOrder].
	[int := newD integerPart. "get the integer part of this"
	frac := newD fractionPart. "and save the fractional part for next time"
	num1 := num2 + ((num2 := num1) * int). "Update numerators"
	denom1 := denom2 + ((denom2 := denom1) * int). "and denominators"
	frac = 0
		or: [order = 0
		or: [((Fraction numerator: num1 denominator: denom1) - self) abs <= limit]]]
		whileFalse:
			[newD := frac reciprocal "Take reciprocal of the fractional part".
			order := order - 1].
	^denom1 = 1
		ifTrue: ["Am i really an Integer?"
			num1"Yes, return Integer result"]
		ifFalse: ["Otherwise return Fraction result"
			Fraction numerator: num1 denominator: denom1]