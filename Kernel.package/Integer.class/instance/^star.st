arithmetic
* aNumber
	"Refer to the comment in Number * " 
	aNumber isInteger ifTrue:
		[^ self multiplyByInteger: aNumber].
	^ aNumber adaptToInteger: self andSend: #*