adding
addAll: aCollection
	| oldBlock |
	oldBlock := block.
	block := [:c | (aCollection includes: c) or: [oldBlock value: c]].
	^aCollection