testing
sendsToSuper
	"Answer whether the receiver sends any message to super."

	| scanner |
	self codeLiteralsDo: [:compiledCode | 
		scanner := InstructionStream on: compiledCode.
		(scanner scanFor: (self encoderClass superSendScanBlockUsing: scanner))
			ifTrue: [^ true]].
	^ false