private
digitMul22: anInteger
	"Multiply after decomposing each operand in two parts, using Karatsuba algorithm.
	Karatsuba perform only 3 multiplications, leading to a cost O(n^3 log2)
	asymptotically better than super O(n^2) for large number of digits n.
	See https://en.wikipedia.org/wiki/Karatsuba_algorithm"
	
	| half xLow xHigh yLow yHigh low mid high |
	"split each in two parts, rounded to upper multiple of 4"
	half := (anInteger digitLength + 7 bitShift: -3) bitShift: 2.
	xLow := self lowestNDigits: half.
	xHigh := self butLowestNDigits: half.
	yLow := anInteger lowestNDigits: half.
	yHigh := anInteger butLowestNDigits: half.
	
	"Karatsuba trick: perform with 3 multiplications instead of 4"
	low := xLow multiplyByInteger: yLow.
	high := xHigh multiplyByInteger: yHigh.
	mid := high + low + (xHigh - xLow multiplyByInteger: yLow - yHigh).
	
	"Sum the parts of decomposition"
	^(high isZero
		ifTrue: [low]
		ifFalse: [(high bitShift: 16*half)
			inplaceAddNonOverlapping: low digitShiftBy: 0])
		+ (mid bitShift: 8*half)