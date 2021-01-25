reading
allocateFixedAndVariableObject: class size: nSlots
	(class isPointers and: [class isVariable]) ifFalse:
		[self error: 'variable pointers class expected'].
	^class basicNew: nSlots - class instSize