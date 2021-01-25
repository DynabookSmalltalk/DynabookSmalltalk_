*System-Support
asSimpleSetter

	self precedence
		caseOf: {
			[ 1 ] -> [ self numArgs = 0 ifTrue: [ ^ (self copyWith: $:) asSymbol ] ].
			[ 3 ] -> [ self numArgs = 1 ifTrue: [ ^ self ] ] }
		otherwise: [].
	
	self error: 'Only simple setters and getters can be converted to simple setters!'.