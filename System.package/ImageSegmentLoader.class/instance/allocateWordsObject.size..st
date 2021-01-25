allocating
allocateWordsObject: classOop size: nWords
	| class |
	class := self fetchClass: classOop.
	class == Float ifTrue: [class := BoxedFloat64].
	(class isBits and: [class isWords]) ifFalse:
		[self error: 'words class expected'].
	^class basicNew: nWords