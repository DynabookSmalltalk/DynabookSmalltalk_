converting
traitDefinitionFrom: aPseudoTrait
	| tokens traitCompositionString lastIndex |
	tokens := Scanner new scanTokens: aPseudoTrait definition.
	traitCompositionString := ((ReadStream on: aPseudoTrait definition)
		match: 'uses:';
		upToAll: 'category:') withBlanksTrimmed.
	traitCompositionString isEmpty ifTrue: [traitCompositionString := '{}'].
	lastIndex := tokens size.
	^ MCTraitDefinition
		name: (tokens at: 3)
		traitComposition: traitCompositionString
		category: (tokens at: lastIndex)
		comment: (self commentFor: aPseudoTrait)
		commentStamp: (self commentStampFor: aPseudoTrait)