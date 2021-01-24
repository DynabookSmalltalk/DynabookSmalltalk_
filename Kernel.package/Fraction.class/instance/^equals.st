comparing
= aNumber
	aNumber isNumber ifFalse: [^ false].
	aNumber isInteger ifTrue: ["If properly reduced, self cannot be an Integer" ^ false].
	aNumber isFraction
		ifTrue: ["Assume that both Fraction are reduced"
				^ numerator = aNumber numerator and:
					[denominator = aNumber denominator]].
	^ aNumber adaptToFraction: self andCompare: #=