filling
fillVariablePointers: object oop: objOop
	1 to: object class instSize do:
		[:index|
		 object instVarAt: index put: self readOop].
	1 to: object basicSize do:
		[:index|
		 object basicAt: index put: self readOop].
	^object