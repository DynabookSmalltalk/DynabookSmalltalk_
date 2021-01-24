literals
indexOfLiteral: literal
	"Answer the literal index of the argument, literal, or zero if none."
	2 to: self numLiterals - 1 "exclude selector/properties + methodClass"
	   do:
		[:index |
		literal == (self objectAt: index) ifTrue: [^index - 1]].
	^0