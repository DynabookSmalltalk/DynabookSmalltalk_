private
multiplyByInteger: anInteger
	"Return the result of multiplying the receiver by the Integer argument.
	This method dispatch to the fastest algorithm based on operands length."
	
	| xLen yLen |
	"Revert to schoolbook multiplication if short"
	(xLen := self digitLength) < self class thresholdForMul22
		ifTrue: [^ self digitMultiply: anInteger 
					neg: self negative ~~ anInteger negative].
	
	"Arrange to have the receiver be the shorter and retry"
	xLen > (yLen := anInteger digitLength)
		ifTrue: [^ anInteger multiplyByInteger: self ].

	"Seek for integers of about the same length, else split the long one"
	yLen > (2 * xLen) ifTrue: [^self digitMulSplit: anInteger].
	
	"Choose the fastest divide and conquer algorithm based on another heuristic"
	xLen >= self class thresholdForMul33 ifTrue: [^self digitMul33: anInteger].
	yLen * 2 >= (3 * xLen) ifTrue: [^self digitMul23: anInteger].
	^self digitMul22: anInteger