arithmetic
quo: aNumber 
	"Refer to the comment in Number quo: "
	| quo |
	aNumber isInteger ifTrue: 
		[quo := (self divideByInteger: aNumber) at: 1.
		^ quo normalize].
	^ aNumber adaptToInteger: self andSend: #quo: