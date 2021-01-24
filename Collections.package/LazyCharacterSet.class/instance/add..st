adding
add: aCharacter
	| oldBlock |
	oldBlock := block.
	block := [:c | c = aCharacter or: [oldBlock value: c]].
	^aCharacter