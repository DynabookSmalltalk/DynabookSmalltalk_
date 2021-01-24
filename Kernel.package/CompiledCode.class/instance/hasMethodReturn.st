testing
hasMethodReturn
	"Answer whether the receiver has a method-return ('^') in its code."

	| scanner |
	self codeLiteralsDo: [:compiledCode | 
		scanner := InstructionStream on: compiledCode.
		(scanner scanFor: [:x | (scanner willReturn
				and: [scanner willBlockReturn not])
				"and: [scanner willReturnTopFromMethod not]" "-> Not supported in EncoderForSistaV1"])
			ifTrue: [^ true]].
	^ false