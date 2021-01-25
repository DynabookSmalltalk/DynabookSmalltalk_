read/write segment
loadSegmentFrom: segment outPointers: outPointers
	"Attempt to load the segment into memory (reify the objects in segment
	 as real objects), using outPointers to bind references to objects not in the
	 segment.  Answer a collection of all the objects in the segment."
	| segmentFormat |
	(state == #imported or: [state == #active]) ifTrue:
		[segmentFormat := self segmentFormatFrom: segment first.
		 segmentFormat = 6502 ifTrue:
			[LegacyImageSegment adoptInstance: self.
			 ^self loadSegmentFrom: segment outPointers: outPointers].
		 segmentFormat = Smalltalk imageFormatVersion ifTrue:
			[NativeImageSegment adoptInstance: self.
			 ^self loadSegmentFrom: segment outPointers: outPointers].
		 self error: 'no handling for format ', segmentFormat asString. ' in a ', Smalltalk imageFormatVersion asString, ' image.'].
	self subclassResponsibility