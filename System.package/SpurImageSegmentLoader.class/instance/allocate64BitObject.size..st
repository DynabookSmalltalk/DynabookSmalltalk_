reading
allocate64BitObject: class size: nLongs
	(class isBits and: [class isLongs]) ifFalse:
		[self error: 'longs class expected'].
	^class basicNew: nLongs