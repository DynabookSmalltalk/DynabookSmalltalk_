public
superclass: aClass
	variableDoubleByteSubclass: t instanceVariableNames: f
	classVariableNames: d poolDictionaries: s category: cat
	"This is the standard initialization message for creating a new class as a subclass of an
	 existing class in which the subclass is to have indexable 16-bit-sized nonpointer variables."
	| oldClassOrNil env |
	aClass instSize > 0
		ifTrue: [^self error: 'cannot make a byte subclass of a class with named fields'].
	(aClass isVariable and: [aClass isShorts not])
		ifTrue: [^self error: 'cannot make a 16-bit short subclass of a class with 8, 32 or 64 bit fields'].
	(aClass isVariable and: [aClass isPointers])
		ifTrue: [^self error: 'cannot make a byte subclass of a class with pointer fields'].
	oldClassOrNil := aClass environment at: t ifAbsent:[nil].
	env := CurrentEnvironment signal ifNil: [aClass environment].
	^self 
		name: t
		inEnvironment: env
		subclassOf: aClass
		type: #shorts
		instanceVariableNames: f
		classVariableNames: d
		poolDictionaries: s
		category: cat