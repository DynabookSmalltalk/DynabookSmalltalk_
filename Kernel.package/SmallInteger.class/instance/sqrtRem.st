mathematical functions
sqrtRem
	"See super"

	| s |
	s := self sqrtFloor.
	^{s. self - (s*s)}