mathematical functions
sqrtRem
	"See super. Use a divide and conquer method to perform this operation.
	See Paul Zimmermann. Karatsuba Square Root. [Research Report] RR-3805, INRIA. 1999, pp.8. <inria-00072854>
	https://hal.inria.fr/inria-00072854/PDF/RR-3805.pdf"
	
	| n qr q s r sr a3a2 a1 a0 |
	"Split self in 4 digits a3,a2,a1,a0 in base b,
	such that most significant digit a3 >= b/4
	It is not a problem to have a3 >= b,
	so we can round b down to a whole number of bytes n"
	n := (self highBit bitShift: -5) max: 1. "bitShift: -2 divide in 4 parts, bitShift: -3 round down in bytes"
	a3a2 := self butLowestNDigits: n * 2.
	a1 := self copyDigitsFrom: n + 1 to: n * 2.
	a0 := self lowestNDigits: n.
	
	sr := a3a2 sqrtRem.
	qr := (sr last bitShift: 8 * n) + a1 divideByInteger: (sr first bitShift: 1).
	q := qr first normalize.
	s := (sr first bitShift: 8 * n) + q.
	r := (qr last normalize bitShift: 8 * n) + a0 - q squared.
	r negative
		ifTrue:
			[r := (s bitShift: 1) + r - 1.
			s := s - 1].
	sr at: 1 put: s; at: 2 put: r.
	^sr
	