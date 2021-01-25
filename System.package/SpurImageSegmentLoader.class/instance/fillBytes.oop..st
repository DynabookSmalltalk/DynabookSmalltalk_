filling
fillBytes: object oop: oop
	| word |
	word := self readUint32.
	1 to: object basicSize do:
		[:i | object basicAt: i put: (word bitAnd: 16rFF).
		word := (i bitAnd: 3) = 0 
			ifTrue: [self readUint32]
			ifFalse: [word >> 8]].
	^object