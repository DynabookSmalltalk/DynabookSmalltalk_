accessing
compilerClass

	^self realClass
		ifNil: [ Compiler ]
		ifNotNil: [ :realClass | realClass compilerClass ]