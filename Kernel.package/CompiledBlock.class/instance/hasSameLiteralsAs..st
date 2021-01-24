comparing
hasSameLiteralsAs: aMethod
	"Answer whether the receiver has the same sequence of literals as the argument.
	 Do not fully compare the last literal as this is the outerCode back pointer to the
	 containing method or block, and following it would cause infinite recursion.  In any
	 case this is a useful definition because it considers identical block methods in other-
	 wise different containing blocks or methods to be the same, which makes sense."
	| numLits |
	numLits := self numLiterals.
	numLits = aMethod numLiterals ifFalse: [^false].
	1 to: numLits - 1 do:
		[:i| | lit1 lit2 |
		lit1 := self literalAt: i.
		lit2 := aMethod literalAt: i.
		(lit1 == lit2 or: [lit1 literalEqual: lit2]) ifFalse:
			[^false]].
	^(self literalAt: numLits) isCompiledCode = (aMethod literalAt: numLits) isCompiledCode