*monticello
traitDefinition: string with: chgRec
	| tokens theTrait |
	tokens := Scanner new scanTokens: string.
	theTrait := self getTrait: (tokens at: 3).
	theTrait definition: string.
	classOrder add: theTrait.