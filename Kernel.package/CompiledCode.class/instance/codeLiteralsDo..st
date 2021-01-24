literals
codeLiteralsDo: aBlock
	"Enumerate all literals that represent instances of CompiledCode. This is especially required for SistaV1."
	
	aBlock value: self.
	
	self literalsDo: [:literal | literal isCompiledCode ifTrue: [
		literal codeLiteralsDo: aBlock]].