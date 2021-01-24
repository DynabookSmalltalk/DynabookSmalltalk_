public
superclass: aClass
	variableByteSubclass: n instanceVariableNames: f
	classVariableNames: d poolDictionaries: s category: cat
	"This is the standard initialization message for creating a new class as a subclass of an
	 existing class in which the subclass is to have indexable 8-bit byte-sized nonpointer variables."
	| existingOrSuperclass actualType env |
	aClass instSize > 0 ifTrue:
		[^self error: 'cannot make a byte subclass of a class with named fields'].
	(aClass isVariable and: [aClass isBytes not]) ifTrue:
		[^self error: 'cannot make an 8-bit byte subclass of a class with 16, 32 or 64 bit fields'].
	(aClass isVariable and: [aClass isPointers]) ifTrue:
		[^self error: 'cannot make a byte subclass of a class with pointer fields'].
	existingOrSuperclass := aClass environment at: n ifAbsent: [aClass].
	actualType := existingOrSuperclass typeOfClass == #compiledMethod
						ifTrue: [#compiledMethod]
						ifFalse: [#bytes].
	env := CurrentEnvironment signal ifNil: [aClass environment].
	^self 
		name: n
		inEnvironment: env
		subclassOf: aClass
		type: actualType
		instanceVariableNames: f
		classVariableNames: d
		poolDictionaries: s
		category: cat