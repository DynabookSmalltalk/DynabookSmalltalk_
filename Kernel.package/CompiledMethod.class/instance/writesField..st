scanning
writesField: varIndex
	"Answer whether the receiver stores into the instance variable indexed by the argument."

	| varIndexCode scanner |
	self isQuick ifTrue: [^ false].
	varIndexCode := varIndex - 1.
	
	self codeLiteralsDo: [:compiledCode | 
		scanner := InstructionStream on: compiledCode.
		(scanner scanFor: (self encoderClass instVarWriteScanBlockFor: varIndex - 1 using: scanner))
			ifTrue: [^ true]].
	
	^ false