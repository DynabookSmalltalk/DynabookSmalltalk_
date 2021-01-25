private
exampleAt: originPoint rule: rule fillColor: mask 
	"This builds a source and destination form and copies the source to the
	destination using the specifed rule and mask. It is called from the method
	named exampleOne. Only works with Display depth of 1"

	^self exampleOn: Display at: originPoint rule: rule fillColor: mask

	"BitBlt exampleAt: 100@100 rule: 0 fillColor: nil"