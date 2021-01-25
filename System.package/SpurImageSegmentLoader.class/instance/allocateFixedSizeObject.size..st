reading
allocateFixedSizeObject: class size: instSize
	(class isPointers and: [class isFixed]) ifFalse:
		[self error: 'fixed pointers class expected'].
	class instSize = instSize ifFalse: [self halt].
	^class basicNew