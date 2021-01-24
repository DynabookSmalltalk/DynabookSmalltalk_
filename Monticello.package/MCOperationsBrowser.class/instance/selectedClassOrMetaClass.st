subclassResponsibility
selectedClassOrMetaClass
	| definition |
	selection ifNil: [ ^nil ].
	(definition := selection definition) ifNil: [ ^nil ].
	(definition isMethodDefinition or: [definition isClassDefinition]) ifFalse: [ ^nil ].
	^ definition actualClassIn: self environmentInDisplayingImage