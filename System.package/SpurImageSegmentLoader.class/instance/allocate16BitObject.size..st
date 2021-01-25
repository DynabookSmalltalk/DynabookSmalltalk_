reading
allocate16BitObject: class size: nShorts
	(class isBits and: [class isShorts]) ifFalse:
		[self error: 'shorts class expected'].
	^class basicNew: nShorts