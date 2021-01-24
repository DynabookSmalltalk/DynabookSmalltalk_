private
notEmptyCheck
	"Ensure the stack is not empty."
	self isEmpty
		ifTrue: [self errorEmptyStack]