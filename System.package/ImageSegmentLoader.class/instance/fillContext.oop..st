filling
fillContext: ctx oop: oop
	position := oop.
	1 to: ctx class instSize do:
		[:i | ctx instVarAt: i put: (self mapOop: self readUint32)].
	1 to: ctx stackPtr do:
		[:i | ctx basicAt: i put: (self mapOop: self readUint32)].
	^ctx