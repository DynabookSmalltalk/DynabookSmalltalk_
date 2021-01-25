allocating
allocateFixedAndVariableObject: classOop size: nWords
	| class |
	classOop = 13 ifTrue:
		[^self allocateBlockContext: nWords].
	classOop = 14 ifTrue:
		[^self allocateMethodContext: nWords].
	class := self fetchClass: classOop.
	(class isPointers and: [class isVariable]) ifFalse:
		[self error: 'variable pointers class expected'].
	^class basicNew: nWords - class instSize