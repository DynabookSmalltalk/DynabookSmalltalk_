public
superclass: aClass
	variableWordSubclass: t instanceVariableNames: f 
	classVariableNames: d poolDictionaries: s category: cat
	"This is the standard initialization message for creating a new class as a subclass of an
	 existing class in which the subclass is to have indexable 32-bit word-sized nonpointer variables."
	| env |
	aClass instSize > 0
		ifTrue: [^self error: 'cannot make a word subclass of a class with named fields'].
	(aClass isVariable and: [aClass isWords not])
		ifTrue: [^self error: 'cannot make a 32-bit word subclass of a class with 8, 16 or 64 bit fields'].
	(aClass isVariable and: [aClass isPointers])
		ifTrue: [^self error: 'cannot make a word subclass of a class with pointer fields'].
	env := CurrentEnvironment signal ifNil: [aClass environment].
	^self 
		name: t
		inEnvironment: env
		subclassOf: aClass
		type: #words
		instanceVariableNames: f
		classVariableNames: d
		poolDictionaries: s
		category: cat