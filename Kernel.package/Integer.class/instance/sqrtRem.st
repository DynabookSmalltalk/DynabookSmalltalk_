mathematical functions
sqrtRem
	"Return an array with floor sqrt and sqrt remainder.
	Assume self >= 0.
	The following invariants apply:
	1) self  sqrtRem first squared <= self
	2) (self sqrtRem first + 1) squared > self
	3) self sqrtRem first squared + self sqrtRem last = self"

	self subclassResponsibility