private
divideByInteger: anInteger
	"Answer an Array with quotient and remainder of division by anInteger.
	the quotient is always truncated toward zero, and remainder has same sign as receiver.
	Beware, the result might be un-normailzed (LargeInteger with leading zero digits)"
	^self digitDiv: anInteger 
			neg: self negative ~~ anInteger negative