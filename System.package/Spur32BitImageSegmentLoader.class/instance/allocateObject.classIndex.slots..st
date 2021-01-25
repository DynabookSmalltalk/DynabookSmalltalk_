reading
allocateObject: format classIndex: classIndex slots: numSlots
	"Allocate an instance of the class referenced by classIndex, with the size computed from numSlots and format."
	| class obj |
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
		 nBytes := numSlots * 4 - (format bitAnd: 3).
		 format >= 24 ifTrue:
			[^self allocateCompiledCode: class size: nBytes].
		 obj := self allocate8BitObject: class size: nBytes.
		 (nBytes <= 8 and: [obj isInteger and: [rangeMappings notNil]]) ifTrue:
			[rangeMappings addLast: obj].
		 ^obj].
	format >= 12 ifTrue:
		[| nShorts |
		 nShorts := numSlots * 2 - (format bitAnd: 1).
		 ^self allocate16BitObject: class size: nShorts].
	format >= 10 ifTrue:
		[obj := self allocate32BitObject: class size: numSlots.
		 (numSlots = 2 and: [obj isFloat and: [rangeMappings notNil]]) ifTrue:
			[rangeMappings addLast: obj].
		 ^obj].
	format = 9 ifTrue:
		[^self allocate64BitObject: class size: numSlots * 2].
	format = 33 ifTrue:
		[^self allocateAndPartFillClassObject: class size: numSlots].
	self error: 'Unknown object format'