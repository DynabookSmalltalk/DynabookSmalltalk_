accessing
hash

	| hash |
	hash := baseTrait hashWithInitialHash: 0.
	hash := self classTraitCompositionString hashWithInitialHash: hash.
	^hash
