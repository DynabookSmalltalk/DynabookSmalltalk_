allocating
allocateBytesObject: classOop size: nBytes
	| class |
	class := self fetchClass: classOop.
	class isBytes ifFalse:
		[self error: 'bytes class expected'].
	^class basicNew: nBytes