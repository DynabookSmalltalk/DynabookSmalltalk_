reading
allocateObject: format classIndex: classIndex slots: numSlots
	"Allocate an instance of the class referenced by classIndex, with the size computed from numSlots and format."
	| class |
	class := (self classIndexInOutPointers: classIndex)
				ifTrue: [outPointers at: (self outPointerIndexForClassIndex: classIndex)]
				ifFalse: [oopMap at: (self oopIndexForClassIndex: classIndex)].
	(format <= 1 or: [format = 5"ephemerons"]) ifTrue:
		[^self allocateFixedSizeObject: class size: numSlots].
	format = 2 ifTrue:
		[^self allocateVariableSizeObject: class size: numSlots].
	(format between: 3 and: 4) ifTrue:
		[^self allocateFixedAndVariableObject: class size: numSlots].
	format >= 16 ifTrue:
		[| nBytes |
		 nBytes := numSlots * 8 - (format bitAnd: 7).
		 format >= 24 ifTrue:
			[^self allocateCompiledCode: class size: nBytes].
		 ^self allocate8BitObject: class size: nBytes].
	format >= 12 ifTrue:
		[| nShorts |
		 nShorts := numSlots * 4 - (format bitAnd: 3).
		 ^self allocate16BitObject: class size: nShorts].
	format >= 10 ifTrue:
		[| nWords |
		 nWords := numSlots * 2 - (format bitAnd: 1).
		 ^self allocate32BitObject: class size: nWords].
	format = 9 ifTrue:
		[^self allocate64BitObject: class size: numSlots].
	format = 33 ifTrue:
		[^self allocateAndPartFillClassObject: class size: numSlots].
	self error: 'Unknown object format'