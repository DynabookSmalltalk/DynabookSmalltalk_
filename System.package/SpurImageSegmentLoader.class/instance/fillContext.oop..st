filling
fillContext: ctx oop: oop
	1 to: ctx class instSize do:
		[:i | ctx instVarAt: i put: self readOop].
	1 to: ctx stackPtr do:
		[:i | ctx basicAt: i put: self readOop].
	^ctx