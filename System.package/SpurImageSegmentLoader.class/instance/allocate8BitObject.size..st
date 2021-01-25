reading
allocate8BitObject: class size: nBytes
	class isBytes ifFalse:
		[self error: 'bytes class expected'].
	^class basicNew: nBytes