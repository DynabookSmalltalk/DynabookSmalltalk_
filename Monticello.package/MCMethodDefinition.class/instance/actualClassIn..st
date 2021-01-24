accessing
actualClassIn: anEnvironment
	^ (anEnvironment at: className ifAbsent: [anEnvironment valueOf: className])
		ifNotNil: [:class |
			class isBehavior ifTrue: [classIsMeta ifTrue: [class classSide] ifFalse: [class]]]