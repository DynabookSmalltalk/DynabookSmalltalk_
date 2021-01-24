literals
hasLiteralSuchThat: testBlock

	self allLiteralsDo: [:literal |
		(testBlock value: literal) ifTrue: [^ true]].
	
	^ false