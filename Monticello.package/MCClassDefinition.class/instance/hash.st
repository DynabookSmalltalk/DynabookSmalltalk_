comparing
hash

	| hash |
	hash := name hashWithInitialHash: 0.
	hash := superclassName hashWithInitialHash: hash.
	hash := self traitCompositionString hashWithInitialHash: hash.
	hash := self classTraitComposition asString hashWithInitialHash: hash.
	hash := (category ifNil: ['']) hashWithInitialHash: hash.
	hash := type hashWithInitialHash: hash.
	variables do: [ :v |
		hash := v name hashWithInitialHash: hash ].
	^hash