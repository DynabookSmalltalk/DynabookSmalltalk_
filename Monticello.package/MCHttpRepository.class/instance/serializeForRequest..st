private
serializeForRequest: aMCDefinition 
	^ ((ReferenceStream on: (RWBinaryOrTextStream on: ByteArray new))
		 nextPut: aMCDefinition ;
		 yourself) contents asString encodeForHTTP