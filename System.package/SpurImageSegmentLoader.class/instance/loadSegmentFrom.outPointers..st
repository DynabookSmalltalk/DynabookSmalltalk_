loading
loadSegmentFrom: segmentWordArray outPointers: outPointerArray
	| version end memory |
	segment := segmentWordArray.
	outPointers := outPointerArray.
	position := 0.
	version := self readUint32.
	(self validImageSegmentVersion: (version bitAnd: 16rFFFFFF)) ifFalse:
		[^self error: 'Cannot read this segment (endianness?)'].
	"First allocate all objects, then fill in their fields via oopMap"
	memory := OrderedCollection new: 1000.
	oopMap := Dictionary new.
	pcDependentObjects := OrderedCollection new.
	end := segment size * 4.
	position := 8.
	[position < end] whileTrue:
		[memory addLast: self readObject].
	self ignoringAccessToWordAfterSegmentDo:
		[oopMap keysAndValuesDo:
			[:oop :obj | self fillObject: obj oop: oop]].
	self updatePCDependentObjects.
	"Answer list of all objects (unlike primitive, which returned the first object and relied on other objects being consecutive in memory)"
	^memory