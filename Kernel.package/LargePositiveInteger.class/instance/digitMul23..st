private
digitMul23: anInteger
	"Multiply after decomposing the receiver in 2 parts, and multiplicand in 3 parts.
	Only invoke when anInteger digitLength between: 3/2 and 5/2 self digitLength.
	This is a variant of Toom-Cook algorithm (see digitMul33:)"
   
	| half x1 x0 y2 y1 y0 y20 z3 z2 z1 z0 |
	"divide self in 2 and operand in 3 parts, rounded to upper multiple of 4"
	half := ( self digitLength + 7 bitShift: -3) bitShift: 2.
	x1 := self butLowestNDigits: half.
	x0 := self lowestNDigits: half.
	y2 := anInteger butLowestNDigits: half * 2.
	y1 := anInteger copyDigitsFrom: half + 1 to: half * 2.
	y0 := anInteger lowestNDigits: half.
   
	"Toom trick: 4 multiplications instead of 6"
	y20 := y2 + y0.
	z3 := x1 multiplyByInteger: y2.
	z2 := x0 - x1 multiplyByInteger: y20 - y1.
	z1 := x0 + x1 multiplyByInteger: y20 + y1.
	z0 := x0 multiplyByInteger: y0.
   
	"Sum the parts of decomposition"
	^z0 + ((z1 - z2 bitShift: -1) - z3 bitShift: 8*half)
		+ (((z1 + z2 bitShift: -1) - z0) + (z3 bitShift: 8*half) bitShift: 16 * half)