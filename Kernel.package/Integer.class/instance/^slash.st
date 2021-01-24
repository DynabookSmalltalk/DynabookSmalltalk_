arithmetic
/ aNumber
	"Refer to the comment in Number / "
	| quoRem |
	aNumber isInteger ifTrue:
		[quoRem := self divideByInteger: aNumber.
		(quoRem at: 2) = 0
			ifTrue: [^ (quoRem at: 1) normalize]
			ifFalse: [^ (Fraction numerator: self denominator: aNumber) reduced]].
	^ aNumber adaptToInteger: self andSend: #/