private
multiplyByInteger: anInteger
	^self digitMultiply: anInteger 
			neg: self negative ~~ anInteger negative