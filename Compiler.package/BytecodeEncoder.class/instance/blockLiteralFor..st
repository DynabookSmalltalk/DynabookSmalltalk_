full blocks
blockLiteralFor: aBlockNode
	"Answer a new CompiledBlock for the code in aBlockNode"
	^self reindexingLiteralsDo:
		[self shallowCopy resetForFullBlockGeneration
			generateBlockMethodOfClass: CompiledBlock
			trailer: CompiledMethodTrailer empty
			from: aBlockNode]