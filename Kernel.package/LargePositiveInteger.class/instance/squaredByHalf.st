private
squaredByHalf
	"Use a divide and conquer algorithm to perform the multiplication.
	Split in two parts like Karatsuba, but economize 2 additions by using asymetrical product."
	
	| half xHigh xLow low high mid |
	
	"Divide digits in two halves rounded tp upper multiple of 4"
	half := (self digitLength + 1 bitShift: -3) bitShift: 2.
	xLow := self lowestNDigits: half.
	xHigh := self butLowestNDigits: half.
	
	"eventually use karatsuba"
	low := xLow squared.
	high := xHigh squared.
	mid := xLow multiplyByInteger: xHigh.
	
	"Sum the parts of decomposition"
	^(high bitShift: 16*half)
		inplaceAddNonOverlapping: low digitShiftBy: 0;
		+ (mid bitShift: 8*half+1)
	
"
| a |
a := 440 factorial-1.
a digitLength.
self assert: a * a - a squaredKaratsuba = 0.
[Smalltalk garbageCollect.
[2000 timesRepeat: [a squaredKaratsuba]] timeToRun] value /
[Smalltalk garbageCollect.
[2000 timesRepeat: [a * a]] timeToRun] value asFloat
"