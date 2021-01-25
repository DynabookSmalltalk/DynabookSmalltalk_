allocating
allocateFixedSizeObject: classOop size: nWords
	| class |
	class := self fetchClass: classOop.
	(class isPointers and: [class isFixed]) ifFalse:
		[self error: 'fixed pointers class expected'].
	class instSize = nWords ifFalse: [self halt].
	^class basicNew