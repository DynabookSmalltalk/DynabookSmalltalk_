reading
allocateCompiledCode: class size: nBytes
	"Allocate a CompiledCode object.  nBytes must be reduced
	 by the number of objects in the method (header and literals)." 
	| header delta |
	class isCompiledMethodClass ifFalse:
		[self error: 'compiled code class expected'].
	header := self readOop.
	delta := (header bitAnd: 32767) + 1 * 8.
	^class newMethod: nBytes - delta header: header