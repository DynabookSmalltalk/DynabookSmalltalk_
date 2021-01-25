read/write segment primitives
loadSegmentFrom: segmentWordArray outPointers: outPointerArray
	"Load segmentWordArray into the memory.  Adapt the primitive to the new API, which is to answer the array of loaded objects, the first of which should be the array of roots.  The primitive will install a binary image segment and return as its value the array
	 of roots of the tree of objects represented.  Upon successful completion, the
	 wordArray will have been becomed into anArray of the loaded objects.  So simply answer the segmentWordArray which will have becommed."

	| segmentFormat |
	segmentFormat := self segmentFormatFrom: segmentWordArray first.
	segmentFormat = Smalltalk imageFormatVersion ifTrue:
		[^(self primitiveLoadSegmentFrom: segmentWordArray outPointers: outPointerArray)
			ifNil: [self error: 'segment load failed']
			ifNotNil: [segmentWordArray]].
	segmentFormat >= 68000
		ifTrue:
			[Smalltalk wordSize = 4 ifTrue:
				[^(Spur64BitImageSegmentLoader new loadSegmentFrom: segmentWordArray outPointers: outPointerArray)]]
		ifFalse:
			[Smalltalk wordSize = 8 ifTrue:
				[^(Spur32BitImageSegmentLoader new loadSegmentFrom: segmentWordArray outPointers: outPointerArray)]].
	self error: 'segment version unrecognized'