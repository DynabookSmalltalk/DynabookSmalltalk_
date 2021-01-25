*System-Support
asSimpleGetter

	self precedence
		caseOf: {
			[ 1 ] -> [ self numArgs = 0 ifTrue: [ ^ self ] ].
			[ 3 ] -> [ self numArgs = 1 ifTrue: [ ^ self allButLast asSymbol ] ] }
		otherwise: [].
	
	self error: 'Only simple setters and getters can be converted to simple getters!'.