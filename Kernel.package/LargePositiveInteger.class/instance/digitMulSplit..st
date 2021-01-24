private
digitMulSplit: anInteger
	"multiply digits when self and anInteger have not well balanced digitlength.
	in this case, it is better to split the largest (anInteger) in several parts and recompose"

	| xLen yLen split q r high mid low sizes |
	yLen := anInteger digitLength.
	xLen := self digitLength.
	"divide in about 1.5 xLen, rounded to upper multiple of 4"
	split := (xLen * 3 + 7 bitShift: -3) bitShift: 2.
	
	"Arrange to sum non overlapping parts"
	q := yLen // split.
	q < 3 ifTrue: [^(0 to: yLen - 1 by: split) detectSum: [:yShift | (self multiplyByInteger: (anInteger copyDigitsFrom: yShift + 1 to: yShift + split)) bitShift: 8 * yShift]].
	r := yLen \\ split.
	"allocate enough bytes, but not too much, in order to minimise normalize cost;
	we could allocate xLen + yLen for each one as well"
	sizes := {q-1*split. q*split. q*split+r}.
	low  := Integer new: (sizes atWrap: 0 - (q\\3)) + xLen neg: self negative ~~ anInteger negative.
	mid := Integer new:  (sizes atWrap: 1 - (q\\3)) + xLen neg: self negative ~~ anInteger negative.
	high := Integer new: (sizes atWrap: 2 - (q\\3)) + xLen neg: self negative ~~ anInteger negative.
	0 to: yLen - 1 by: 3 * split do: [:yShift |
		low
			inplaceAddNonOverlapping: (self multiplyByInteger: (anInteger copyDigitsFrom: yShift + 1 to: yShift + split))
			digitShiftBy: yShift].
	split to: yLen - 1 by: 3 * split do: [:yShift |
		mid
			inplaceAddNonOverlapping: (self multiplyByInteger: (anInteger copyDigitsFrom: yShift + 1 to: yShift + split))
			digitShiftBy: yShift].
	split * 2 to: yLen - 1 by: 3 * split do: [:yShift |
		high
			inplaceAddNonOverlapping: (self multiplyByInteger: (anInteger copyDigitsFrom: yShift + 1 to: yShift + split))
			digitShiftBy: yShift].
	^high normalize + mid normalize + low normalize