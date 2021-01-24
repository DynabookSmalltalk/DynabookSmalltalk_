private
initialGuessForNthRoot: n
	"Try a divide and conquer approach for the initial guess of nth-root of receiver"
	
	| p high mid q s sn1 |
	"Split self in high*b^n+mid*b+low"
	p := ((self highBit bitShift: -1) // n) bitShift: -3.
	p >= 4 ifFalse: [^super initialGuessForNthRoot: n].
	high := self butLowestNDigits: p * n.
	mid := self copyDigitsFrom: p + 1 to: p * n.
	
	s := high nthRootTruncated: n.
	sn1 := s raisedToInteger: n - 1.
	q := (sn1 * s bitShift: n - 1 * 8 * p) + mid quo: (sn1 * n bitShift: n - 2 * 8 * p).
	^(s bitShift: 8 * p) + q
	