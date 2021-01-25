reading
allocateVariableSizeObject: class size: numSlots
	(class isPointers and: [class isVariable]) ifFalse:
		[self error: 'variable pointers class expected'].
	^class basicNew: numSlots