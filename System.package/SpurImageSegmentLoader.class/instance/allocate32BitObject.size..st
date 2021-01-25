reading
allocate32BitObject: class size: nWords
	(class isBits and: [class isWords]) ifFalse:
		[self error: 'words class expected'].
	^class basicNew: nWords