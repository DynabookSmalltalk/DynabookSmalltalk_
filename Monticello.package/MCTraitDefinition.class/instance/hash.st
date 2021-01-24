comparing
hash

	| hash |
	hash := name hashWithInitialHash: 0.
	hash := self traitCompositionString hashWithInitialHash: hash.
	hash := (category ifNil: ['']) hashWithInitialHash: hash.
	^hash
