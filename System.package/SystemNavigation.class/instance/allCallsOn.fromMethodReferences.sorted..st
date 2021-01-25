query
allCallsOn: aLiteral fromMethodReferences: methodReferences sorted: sorted
	"Answer a collection of all the methods implemented by behaviors that call on aLiteral even deeply embedded in literal arrays."
	
	| result canBeSpecial |
	canBeSpecial := BytecodeEncoder canBeSpecialLiteral: aLiteral.
	result := methodReferences select: [:reference |
		reference compiledMethod
			ifNil: [false]
			ifNotNil: [:method | method hasLiteral: aLiteral scanForSpecial: canBeSpecial]].
	sorted ifTrue: [result sort].
	^result