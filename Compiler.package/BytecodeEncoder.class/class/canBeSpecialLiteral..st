testing
canBeSpecialLiteral: aLiteral
	"This check can be used to prevent unnecessary use of #scanBlockOrNilForLiteral:. For performance, this method summarizes specializations from all known bytecode encoders. It is not meant to be refined per bytecode encoder."
	
	aLiteral isSymbol ifTrue: [^ Smalltalk specialSelectors identityIncludes: aLiteral].
	aLiteral isCharacter ifTrue: [^ aLiteral asInteger <= 65535].
	aLiteral isInteger ifTrue: [^ aLiteral between: -32768 and: 32767].

	aLiteral == true ifTrue: [^ true].
	aLiteral == false ifTrue: [^ true].
	aLiteral == nil ifTrue: [^ true].

	^ false