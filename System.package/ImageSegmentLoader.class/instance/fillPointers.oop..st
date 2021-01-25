filling
fillPointers: object oop: oop
	position := oop.
	1 to: object class instSize do:
		[:i | object instVarAt: i put: (self mapOop: self readUint32)].
	1 to: object basicSize do:
		[:i | object basicAt: i put: (self mapOop: self readUint32)].
	^object