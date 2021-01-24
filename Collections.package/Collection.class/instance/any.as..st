accessing
any: numberOfElements as: aClass
	"Enumerate this colleciton and return the specified number of elements. Signals an error if this collection has not enough elements."
	
	| index result |
	index := 0.
	result := aClass new: numberOfElements.
	
	result fillFrom: self with: [:each |
		(index := index + 1) > numberOfElements
			ifTrue: [^ result]
			ifFalse: [each]].

	index = numberOfElements
		ifFalse: [self error: 'Not enough elements in this collection.'].
	
	^ result