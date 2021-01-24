instance creation
lookup: aStringOrSymbol

	| originalNewSymbols originalSymbolTable |
	originalNewSymbols := NewSymbols.
	originalSymbolTable := SymbolTable.
	^(originalSymbolTable like: aStringOrSymbol) ifNil: [
		 originalNewSymbols like: aStringOrSymbol ]