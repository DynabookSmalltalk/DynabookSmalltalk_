query
allCallsOn: aLiteral fromBehaviors: behaviors sorted: sorted
	"Answer a collection of all the methods implemented by behaviors that call on aLiteral even deeply embedded in literal arrays."
	
	| result canBeSpecial |
	result := OrderedCollection new.
	canBeSpecial := BytecodeEncoder canBeSpecialLiteral: aLiteral.
	behaviors do: [:behavior |
		behavior selectorsAndMethodsDo: [:selector :method |
			(method hasLiteral: aLiteral scanForSpecial: canBeSpecial)
				ifTrue: [result addLast: method methodReference]]].
	sorted ifTrue: [result sort].
	^result