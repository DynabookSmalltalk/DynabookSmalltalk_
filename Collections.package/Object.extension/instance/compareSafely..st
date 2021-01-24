*collections
compareSafely: anObject
	^ self class = anObject class
		ifTrue: [ self printString < anObject printString ]
		ifFalse: [ self class name < anObject class name ]