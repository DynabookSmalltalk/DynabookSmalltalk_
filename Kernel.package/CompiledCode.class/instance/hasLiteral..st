literals
hasLiteral: aLiteral
	"Overwrite this method to invoke the bytecode encoder scanner explicitely. This might be removed if there would be a way to enumerate special literals in a compiled-code object. See #allLiteralsDo:."

	^ self
		hasLiteral: aLiteral
		scanForSpecial: (BytecodeEncoder canBeSpecialLiteral: aLiteral)