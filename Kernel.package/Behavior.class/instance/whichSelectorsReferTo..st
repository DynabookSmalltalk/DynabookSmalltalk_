testing method dictionary
whichSelectorsReferTo: literal 
	"Answer a Set of selectors whose methods access the argument as a literal. Note that we cannot use #systemNavigation because this method should not depend on the 'System' package."

	| who canBeSpecial |
	canBeSpecial := BytecodeEncoder canBeSpecialLiteral: literal.
	who := IdentitySet new.
	self selectorsAndMethodsDo: [:selector :method |
		(method hasLiteral: literal scanForSpecial: canBeSpecial)
			ifTrue: [who add: selector]].
	^ who

	"Rectangle whichSelectorsReferTo: #+."