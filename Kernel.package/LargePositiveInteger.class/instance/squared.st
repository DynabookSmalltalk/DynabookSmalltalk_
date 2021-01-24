mathematical functions
squared
	"Eventually use a divide and conquer algorithm to perform the multiplication"

	(self digitLength >= self class thresholdForSquaredByHalf) ifFalse: [^self * self].
	(self digitLength >= self class thresholdForSquaredByFourth) ifFalse: [^self squaredByHalf].
	^self squaredByFourth