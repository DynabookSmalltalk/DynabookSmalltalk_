allocating
allocateVariableSizeObject: classOop size: nWords
	| class |
	class := self fetchClass: classOop.
	(class isPointers and: [class isVariable]) ifFalse:
		[self error: 'variable pointers class expected'].
	^class basicNew: nWords