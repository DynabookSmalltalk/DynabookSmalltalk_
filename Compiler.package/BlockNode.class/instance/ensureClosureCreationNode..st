accessing
ensureClosureCreationNode: encoder
	closureCreationNode ifNil:
		[closureCreationNode := LiteralNode new
									key: #closureCreationNode
									code: (encoder supportsFullBlocks ifTrue: [LdLitType negated])].
	^closureCreationNode