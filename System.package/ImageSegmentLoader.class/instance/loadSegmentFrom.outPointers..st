loading
loadSegmentFrom: segmentWordArray outPointers: outPointerArray
	| version end memory |
	segment := segmentWordArray.
	outPointers := outPointerArray.
	position := 0.
	version := self readUint32.
	(version bitAnd: 16rFFFF) = 6502 ifFalse:
		[^self error: 'Cannot read this segment (endianness?)'].
	"First allocate all objects, then fill in their fields via oopMap"
	memory := OrderedCollection new: 1000.
	oopMap := Dictionary new.
	end := segment size * 4.
	[position < end] whileTrue:
		[memory add: self readObject].
	oopMap keysAndValuesDo:
		[:oop :obj | self fillObject: obj oop: oop].
	"Return list of all objects (unlike primitive, which returned the first object and relied on other objects being consecutive in memory)"
	^memory