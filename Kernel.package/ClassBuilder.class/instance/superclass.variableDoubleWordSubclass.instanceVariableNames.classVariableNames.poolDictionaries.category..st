public
superclass: aClass
	variableDoubleWordSubclass: t instanceVariableNames: f
	classVariableNames: d poolDictionaries: s category: cat
	"This is the standard initialization message for creating a new class as a subclass of an
	 existing class in which the subclass is to have indexable 16-bit-sized nonpointer variables."
	| oldClassOrNil env |
	aClass instSize > 0
		ifTrue: [^self error: 'cannot make a byte subclass of a class with named fields'].
	(aClass isVariable and: [aClass isLongs not])
		ifTrue: [^self error: 'cannot make a 64-bit long subclass of a class with 8, 16 or 32 bit fields'].
	(aClass isVariable and: [aClass isPointers])
		ifTrue: [^self error: 'cannot make a byte subclass of a class with pointer fields'].
	oldClassOrNil := aClass environment at: t ifAbsent:[nil].
	env := CurrentEnvironment signal ifNil: [aClass environment].
	^self 
		name: t
		inEnvironment: env
		subclassOf: aClass
		type: #longs
		instanceVariableNames: f
		classVariableNames: d
		poolDictionaries: s
		category: cat