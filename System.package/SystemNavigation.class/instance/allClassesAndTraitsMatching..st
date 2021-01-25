query
allClassesAndTraitsMatching: pattern
	"Given a pattern and an environment, try to find a class or trait using several strategies:
		- EXACT: If there is a class or trait whose name exactly given by pattern, return it.
		- UPPER: If the pattern is upper-case only, find camel-case letters with that sequence.
		- WILD: Try the pattern as-is for regular wild-card search.
		- FEATURE: Split patterns at feature boundaries and insert wild cards between.
		- FUZZY: Split patterns at feature boundaries BUT treat each feature as a full class name.
	If there is only one class or trait in the given environment whose name matches pattern, return it. Otherwise, put up a menu offering the names of all classes that match pattern, and return the class chosen, else nil if nothing chosen.
	
	!! In any case, separator characters in the pattern are ignored."
	
	| toMatch potentialNames names |
	
	"If there's a class or trait named as pattern, then return it."
	(environment classOrTraitNamed: pattern) ifNotNil: [:classOrTrait | ^ {classOrTrait}].

	"Validate pattern."	
	toMatch := pattern copyWithoutAll: Character separators.
	toMatch := toMatch asLowercase copyWithout: $..
	toMatch ifEmpty: [ ^ #() ].

	"Fetch search space."
	names := OrderedCollection new.
	potentialNames := environment classAndTraitNames.

	"Try uppercase-only patterns for patterns such as 'WKD' to find 'WeakIdentityKeyDictionary' etc."
	(pattern allSatisfy: [:char | char isUppercase]) ifTrue: [
		| patternSize |
		patternSize := pattern size.
		potentialNames do: [ :eachName | 
			| lookupIndex characterIndex |
			lookupIndex := 0.
			characterIndex := 1.
			[ (lookupIndex := eachName
					indexOf: (pattern at: characterIndex)
					startingAt: lookupIndex + 1) > 0
				and: [ (characterIndex := characterIndex + 1) <= patternSize ] ] whileTrue.
			lookupIndex > 0 ifTrue: [ names add: eachName ] ] ].
	
	"Try wildcard search for patterns such as 'Weak*Dict*' to find 'WeakIdentityKeyDictionary' etc."
	names ifEmpty: [
		potentialNames do: [ :each | (toMatch match: each) ifTrue: [ names add: each ] ].
		"Try feature-based search for patterns such as 'WeakDict' to find 'WeakIdentityKeyDictionary' etc."
		names ifEmpty: [
			"Insert wildcards before, between, and after features."
			toMatch := '*', ((pattern copyWithoutAll: '.*#') findFeatures joinSeparatedBy: '*'), '*'.
			potentialNames do: [ :each | (toMatch match: each) ifTrue: [ names add: each ] ] ] ].
	
	"Try some fuzzy matching."
	pattern suggestedTypeNames do: [ :each |
		(potentialNames includes: each) ifTrue: [ names add: each ] ].
	
	"Still no match?"
	^ names collect: [ :each | environment classOrTraitNamed: each ]
