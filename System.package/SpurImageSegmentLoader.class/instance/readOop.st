reading
readOop
	"Read an oop and map it to an object:
		- The oop may be immediate in which case its tag indicates its class and the remeaining bits its value.
		- the oop may have its top bit set in which case it is an index into the outPointers
		- otherwise the oop is a byte offset from the start of the first object in the segment and is in oopMap."
	self subclassResponsibility