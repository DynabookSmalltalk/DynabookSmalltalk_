private
squaredByFourth
	"Use a 4-way Toom-Cook divide and conquer algorithm to perform the multiplication.
	See Asymmetric Squaring Formulae Jaewook Chung and M. Anwar Hasan
	https://www.lirmm.fr/arith18/papers/Chung-Squaring.pdf"
	
	| p a0 a1 a2 a3 a02 a13 s0 s1 s2 s3 s4 s5 s6 t2 t3 |
	"divide in 4 parts, rounded to upper multiple of 4"
	p := (self digitLength + 15 bitShift: -4) bitShift: 2.
	a3 := self butLowestNDigits: p * 3.
	a2 := self copyDigitsFrom: p * 2 + 1 to: p * 3.
	a1 := self copyDigitsFrom: p + 1 to: p * 2.
	a0 := self lowestNDigits: p.
	
	"Toom-4 trick: 7 multiplications instead of 16"
	a02 := a0 - a2.
	a13 := a1 - a3.
	s0 := a0 squared.
	s1 := (a0 * a1) bitShift: 1.
	s2 := (a02 + a13) * (a02 - a13).
	s3 := ((a0 + a1) + (a2 + a3)) squared.
	s4 := (a02 * a13) bitShift: 1.
	s5 := (a3 * a2) bitShift: 1.
	s6 := a3 squared.
	
	"Interpolation"
	t2 := s1 + s5.
	t3 := (s2 + s3 + s4 bitShift: -1) - t2.
	s3 := t2 - s4.
	s4 := t3 - s0.
	s2 := t3 - s2 - s6.
	
	"Sum the parts of decomposition"
	^s0 + (s1 bitShift: 8*p) + (s2 + (s3 bitShift: 8*p) bitShift: 16*p)
	+(s4 + (s5 bitShift: 8*p) + (s6 bitShift: 16*p) bitShift: 32*p)
	
"
| a |
a := 770 factorial-1.
a digitLength.
[a * a - a squaredToom4 = 0] assert.
[Smalltalk garbageCollect.
[1000 timesRepeat: [a squaredToom4]] timeToRun] value /
[Smalltalk garbageCollect.
[1000 timesRepeat: [a squaredKaratsuba]] timeToRun] value asFloat
"