filling
fillWords: object oop: oop
	position := oop.
	1 to: object basicSize do:
		[:i | object basicAt: i put: self readUint32].
