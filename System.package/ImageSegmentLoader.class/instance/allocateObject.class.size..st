allocating
allocateObject: format class: class size: nWords
	| nBytes |
	format <= 1 ifTrue:
		[^self allocateFixedSizeObject: class size: nWords].
	format = 2 ifTrue:
		[^self allocateVariableSizeObject: class size: nWords].
	(format between: 3 and: 4) ifTrue:
		[^self allocateFixedAndVariableObject: class size: nWords].
	format = 6 ifTrue:
		[^self allocateWordsObject: class size: nWords].
	nBytes :=  (nWords * 4) - (format bitAnd: 3).
	format >= 12 ifTrue:
		[^self allocateCompiledMethod: nBytes].
	format >= 8 ifTrue:
		[^self allocateBytesObject: class size: nBytes].
	self error: 'Unknown object format'.
