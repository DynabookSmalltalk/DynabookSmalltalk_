removing
remove: aCharacter
	| oldBlock |
	oldBlock := block.
	block := [:c | (c = aCharacter) not and: [oldBlock value: c]].
	^aCharacter