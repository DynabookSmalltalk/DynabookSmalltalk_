mathematical functions
sqrtFloor
	"Return the integer part of the square root of self
	Assume self >= 0
	The following post-conditions apply:
	1) self sqrtFloor squared <= self
	2) (self sqrtFloor + 1) squared > self"

	self subclassResponsibility