converting
as: otherClass
	otherClass = CharacterSet ifTrue: [^self].
	^super as: otherClass