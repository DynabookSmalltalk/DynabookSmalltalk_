private
squaredByThird
	"Use a 3-way Toom-Cook divide and conquer algorithm to perform the multiplication"
	
	| third x0 x1 x2 x20 z0 z1 z2 z3 z4 |
	"divide in 3 parts, rounded to upper multiple of 4"
	third := self digitLength + 11 // 3 bitShift: 2.
	x2 := self butLowestNDigits: third * 2.
	x1 := self copyDigitsFrom: third + 1 to: third * 2.
	x0 := self lowestNDigits: third.
	
	"Toom-3 trick: 5 multiplications instead of 9"
	z0 := x0 squared.
	z4 := x2 squared.
	x20 := x2 + x0.
	z1 := (x20 + x1) squared.
	x20 := x20 - x1.
	z2 := x20 squared.
	z3 := ((x20 + x2 bitShift: 1) - x0) squared.
	
	"Sum the parts of decomposition"
	z3 := z3 - z1 quo: 3.
	z1 := z1 - z2 bitShift: -1.
	z2 := z2 - z0.
	
	z3 := (z2 - z3 bitShift: -1) + (z4 bitShift: 1).
	z2 := z2 + z1 - z4.
	z1 := z1 - z3.
	^z0 + (z1 bitShift: 8*third) + (z2 bitShift: 16*third) + (z3 + (z4 bitShift: 8*third) bitShift: 24*third)
	
"
| a |
a := 1400 factorial-1.
a digitLength.
self assert: a * a - a squaredToom3 = 0.
[Smalltalk garbageCollect.
[1000 timesRepeat: [a squaredToom3]] timeToRun] value /
[Smalltalk garbageCollect.
[1000 timesRepeat: [a squaredKaratsuba]] timeToRun] value asFloat
"