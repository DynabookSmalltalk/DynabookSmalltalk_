removing
removeAll: aCollection
	| oldBlock |
	oldBlock := block.
	block := [:c | (aCollection includes: c) not and: [oldBlock value: c]].
	^aCollection