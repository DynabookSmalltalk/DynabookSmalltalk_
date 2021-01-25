rules-basic
foreign

	| aGrammar aRule g ans |
	aGrammar := self apply: #anything.
	aRule := self apply: #anything.
	g := aGrammar new initInput: (OM2StreamProxy for: input).
	ans := g apply: aRule.
	input := g input target.
	^ ans