literals
codeLiteralsDo: aBlock
	"Overwritten to not cause infinite loop."

	aBlock value: self.

	self literalsDo: [:literal |
		(literal isCompiledCode and: [literal ~~ self outerCode]) ifTrue: [
			literal codeLiteralsDo: aBlock]].