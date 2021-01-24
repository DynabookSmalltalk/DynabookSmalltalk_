literals
literalsDo: aBlock
	"Evaluate aBlock for each of the literals referenced by the receiver. Note that this (raw) enumeration addresses *all* objects stored *after* the method header and *before* the first byte code. If you require a deep and meaningful enumeration of literals use #allLiteralsDo: or #codeLiteralsDo:."
	
	1 to: self numLiterals do: [:index |
		aBlock value: (self literalAt: index)].