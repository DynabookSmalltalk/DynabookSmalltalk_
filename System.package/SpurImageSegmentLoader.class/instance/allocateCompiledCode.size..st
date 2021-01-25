reading
allocateCompiledCode: class size: nBytes
	"Allocate a CompiledCode object.  nBytes must be reduced
	 by the number of objects in the method (header and literals)." 
	self subclassResponsibility