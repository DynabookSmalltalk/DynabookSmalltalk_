instruction decoding
pushFullClosure: aCompiledBlock numCopied: numCopied
	| copiedValues |
	copiedValues := ((1 to: numCopied) collect: [:ign| stack removeLast]) reversed.
	self doClosureCopy: aCompiledBlock copiedValues: copiedValues