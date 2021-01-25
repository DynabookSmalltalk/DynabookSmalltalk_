private
lookahead: aBlock

	| origInput ans |
	origInput := input.
	ans := aBlock value.
	input := origInput.
	^ ans