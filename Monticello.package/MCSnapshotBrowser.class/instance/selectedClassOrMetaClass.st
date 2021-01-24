accessing
selectedClassOrMetaClass
	| class |
	classSelection ifNil: [ ^nil ].
	class := Smalltalk at: classSelection ifAbsent: [ ^nil ].
	^self switchIsClass ifTrue: [ class class ]
		ifFalse: [ class ].