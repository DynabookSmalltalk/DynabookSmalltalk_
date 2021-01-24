apply primitives
tryPrimitive: primIndex withArgs: argumentArray
	"Invoke the primitive with number primIndex, answering its result,
	 or, if the primiitve fails, the error code."

	<primitive: 118 error: errorCode>
	^Context primitiveFailTokenFor: errorCode