code generation
createBlockLiteral: encoder
	^self
		reindexingLocalsDo: [encoder blockLiteralFor: self]
		encoder: encoder