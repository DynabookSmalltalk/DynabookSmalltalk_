comparing
hash
	| hash |
	hash := classIsMeta asString hashWithInitialHash: 0.
	hash := source hashWithInitialHash: hash.
	hash := category hashWithInitialHash: hash.
	hash := className hashWithInitialHash: hash.
	^ hash