filling
fillObject: object oop: oop
	"Fill the object's inst vars with data/other objects.  Remember any pc-dependent objects (contexts
	 and blocks) so that their pcs can be updated when their methods have been brought in as well."
	| class |
	"First set position to 4 bytes before the first field, in readiness to read the object's data"
	position := oop + 16. "8 bytes of version stamp  + 8 bytes of object header - 4 bytes of preincrement + 4 bytes 0->1 relative index"
	class := object class.
	class isPointers ifTrue:
		[class isVariable ifTrue:
			[object isContext ifTrue:
				[pcDependentObjects addLast: object.
				 ^self fillContext: object oop: oop].
			 object isBlock ifTrue:
				[pcDependentObjects addLast: object].
			^self fillVariablePointers: object oop: oop].
		object isBehavior ifTrue:
			[^self fillBehavior: object oop: oop].
		 ^self fillPointers: object oop: oop].
	class isBytes ifTrue:
		[object isCompiledCode ifTrue:
			[^self fillCompiledCode: object oop: oop].
		 ^self fillBytes: object oop: oop].
	class isWords ifTrue:
		[^self fillWords: object oop: oop].
	class isLongs ifTrue:
		[^self fillWords: object oop: oop].
	^self fillShorts: object oop: oop