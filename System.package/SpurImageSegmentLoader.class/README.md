SpurImageSegmentLoader is the abstract class for loaders of 32-bit and 64-bit Spur image segments.  The VM has both storing and loading primitives and the store primitive is always used.  The load primitive is used when the word size of the current system matches that of the stored segment (orf the word size of the system in which the segment was stored).  A word on encoding.  The keys in oopMap are byte positions of the start of the object, offset by the 64-bit version stamp.  So the first object, which has oop 0, is in the map at 0, and corresponds to index 3 in the segment data.

position starts at zero and readUInt32 increments position by 4 before using uint32At: to access segment.  Hence the first access via readUInt32 is of index 1 in segment data.  Later on position is reset to 8 bytes beyond the oop to access the data.

Instance Variables
	oopMap:		<Dictionary of: oop (Integer) -> object>
	outPointers:	<Array>
	position:		<Integer>
	segment:		<WordArrayForSegment>

oopMap
	- the map from the oop of an object to the object with that oop

outPointers
	- the array of imported objects, objects not in the segment but referred to by the segment

position
	- the current position when parsing the segment

segment
	- the segment data, which starts with 64-bits of version stamp, so the first object starts at index 3, and has oop 0.
