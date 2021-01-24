resolving 
chooseSameAST
	| fromSrc toSrc |
	(self definition isNil or: [self definition isMethodDefinition not])
		ifTrue: [^ self].
	fromSrc := (Parser new parse: operation fromSource class: nil class)
		generate decompile asString.
	toSrc := (Parser new parse: operation toSource class: nil class)
		generate decompile asString.
	fromSrc = toSrc ifTrue: [self chooseLocal].