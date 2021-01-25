filling
fillObject: object oop: oop
	object isBehavior ifTrue:
		[^self fillBehavior: object oop: oop].
	object isContext ifTrue:
		[^self fillContext: object oop: oop].
	object class isPointers ifTrue:
		[^self fillPointers: object oop: oop].
	object isCompiledMethod ifTrue:
		[^self fillCompiledMethod: object oop: oop].
	object class isBytes ifTrue:
		[^self fillBytes: object oop: oop].
	^self fillWords: object oop: oop

