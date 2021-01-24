keystroke helpers
handleFiltering: evt

	| matchString |
	matchString := self valueOfProperty: #matchString ifAbsentPut: [ String new ].
	matchString := true
		caseOf: {
			[ evt keyCharacter = Character backspace ] ->
				[ matchString isEmpty 
					ifTrue: [ matchString ] 
					ifFalse: [ matchString allButLast ] ].
			[ evt keyValue >= 32 ] ->
				[ matchString , evt keyCharacter ] }
		otherwise: [ matchString ].
	self setProperty: #matchString toValue: matchString.
	self displayFiltered: evt