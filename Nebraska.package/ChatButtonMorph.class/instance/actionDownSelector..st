accessing
actionDownSelector: aSymbolOrString

	(nil = aSymbolOrString or:
	['nil' = aSymbolOrString or:
	[aSymbolOrString isEmpty]])
		ifTrue: [^actionDownSelector := nil].

	actionDownSelector := aSymbolOrString asSymbol.