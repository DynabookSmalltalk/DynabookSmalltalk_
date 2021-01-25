filling
fillCompiledCode: codeObject oop: oop
	| header startMinusOne numBytes word |
	header := self readOop.
	1 to: codeObject numLiterals do:
		[:i | codeObject literalAt: i put: self readOop].
	startMinusOne := codeObject initialPC - 1.
	numBytes := codeObject basicSize - startMinusOne.
	word := self readUint32.
	1 to: numBytes do:
		[:i |
		 codeObject basicAt: startMinusOne + i put: (word bitAnd: 16rFF).
		 word := (i bitAnd: 3) = 0 
			ifTrue: [self readUint32]
			ifFalse: [word >> 8]].
	^codeObject