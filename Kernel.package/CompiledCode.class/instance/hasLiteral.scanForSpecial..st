literals
hasLiteral: aLiteral scanForSpecial: aBoolean
	"Like #hasLiteral: but can scan for encoder-specific special literals. Not that scanning has a noticeable performance impact."

	| scanBlock |
	(super hasLiteral: aLiteral) ifTrue: [^ true].
	
	aBoolean ifFalse: [^ false].

	scanBlock := self class
		scanBlocksForLiteral: aLiteral
		do: [:primaryScanner :secondaryScanner |
			"E.g., scanner for SistaV1 or scanner for V3PlusClosures"
			self signFlag ifTrue: [secondaryScanner] ifFalse: [primaryScanner]].
	
	self codeLiteralsDo: [:compiledCode |
		(compiledCode scanFor: scanBlock) ifTrue: [^ true]].

	^ false