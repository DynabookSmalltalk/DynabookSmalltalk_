subclassResponsibility
selectedClass
	| definition |
	selection ifNil: [ ^nil ].
	(definition := selection definition) ifNil: [ ^nil ].
	definition isMethodDefinition ifFalse: [ ^nil ].
	definition className in: [:className | | environment |
		environment := self environmentInDisplayingImage.
		^ environment at: className ifAbsent: [environment valueOf: className]]