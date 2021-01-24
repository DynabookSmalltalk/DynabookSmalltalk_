private
receiver: receiver tryPrimitive: primIndex withArgs: argumentArray
	"Invoke the primitive with number primIndex, with the receiver and arguments
	 supplied, answering its result, or, if the primiitve fails, the error code."

	<primitive: 118 error: errorCode>
	^self class primitiveFailTokenFor: errorCode