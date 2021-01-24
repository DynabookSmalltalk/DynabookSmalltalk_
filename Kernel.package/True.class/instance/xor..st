logical operations
xor: aBoolean
	"aBoolean is either a boolean, or an object who's #value returns a boolean (usually a block)."
	^aBoolean value ifTrue: [ false ] ifFalse: [ true ]