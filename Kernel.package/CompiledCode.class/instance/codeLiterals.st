literals
codeLiterals

	^ Array streamContents: [:stream |
		self codeLiteralsDo: [:compiledCode | stream nextPut: compiledCode]]