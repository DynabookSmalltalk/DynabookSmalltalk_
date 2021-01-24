scanning
readsField: varIndex 
	"Answer whether the receiver loads the instance variable indexed by the argument."

	| varIndexCode scanner |
	varIndexCode := varIndex - 1.
	self isQuick ifTrue: [^ self isReturnField and: [self returnField = varIndexCode]].
	
	self codeLiteralsDo: [:compiledCode | 
		scanner := InstructionStream on: compiledCode.
		(scanner scanFor: (self encoderClass instVarReadScanBlockFor: varIndexCode using: scanner))
			ifTrue: [^ true]].

	^ false