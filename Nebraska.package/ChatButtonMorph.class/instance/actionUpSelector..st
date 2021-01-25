accessing
actionUpSelector: aSymbolOrString


	(nil = aSymbolOrString or:
	 ['nil' = aSymbolOrString or:
	 [aSymbolOrString isEmpty]])
		ifTrue: [^ actionUpSelector := nil].

	actionUpSelector := aSymbolOrString asSymbol.