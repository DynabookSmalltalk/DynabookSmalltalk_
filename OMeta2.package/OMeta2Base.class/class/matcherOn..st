as yet unclassified
matcherOn: aReadStream

	| input matcher |
	input := OM2LazyStream for: aReadStream withPos: 1.
	matcher := self new initInput: input.
	^ matcher