filling
fillPointers: object oop: objOop
	1 to: object class instSize do:
		[:index|
		 object instVarAt: index put: self readOop].
	^object