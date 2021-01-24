accessing
selectedClass
	| environment |
	classSelection ifNil: [ ^nil ].
	environment := self environmentInDisplayingImage.
	^ environment at: classSelection ifAbsent: [environment valueOf: classSelection]
