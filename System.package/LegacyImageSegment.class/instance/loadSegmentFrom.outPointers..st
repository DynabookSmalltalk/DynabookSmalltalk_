read/write segment primitives
loadSegmentFrom: segment outPointers: outPointers
	"Attempt to load the segment into memory (reify the objects in segment
	 as real objects), using outPointers to bind references to objects not in the
	 segment.  Answer a collection of all the objects in the segment."
	^ImageSegmentLoader new loadSegmentFrom: segment outPointers: outPointers