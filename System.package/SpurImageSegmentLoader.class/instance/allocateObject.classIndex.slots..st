reading
allocateObject: format classIndex: classIndex slots: numSlots
	"Allocate an instance of the class referenced by classIndex, with the size computed from numSlots and format."
	self subclassResponsibility