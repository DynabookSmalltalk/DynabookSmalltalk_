rules-basic
form: aBlock

	| v origInput |
	v := self apply: #anything.
	self pred: (v isCollection and: [v isSequenceable and: [v isSymbol not]]).
	origInput := input.
	input := om2streams at: v ifAbsentPut: [OM2LazyStream for: v readStream withPos: 1].
	aBlock value.
	self apply: #end.
	input := origInput.
	^ v