literals
allLiteralsDo: aBlock
	"Overwritten to skip certain (raw) literals."
		
	" Exclude method selector (or properties) and the method's class."
	1 to: self numLiterals - 2 do: [:index |
		(self literalAt: index) allLiteralsDo: aBlock].

	"Enumerate method selector only through additional method state."
	self penultimateLiteral isMethodProperties
		ifTrue: [self penultimateLiteral allLiteralsDo: aBlock].
	
	"Enumerate special selectors."
	self flag: #todo.
	
	"Enumerate special literals such as true and false."
	self flag: #todo.