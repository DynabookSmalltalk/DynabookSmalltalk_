printing
printReferenceOn: aStream
	"Override to indicate that this is a block, and to print a null reference when
	 the CompiledBlock is only partially initialized, as it is during compilation."
	aStream nextPutAll: '[] in '.
	self outerCode isVariableBinding
		ifTrue: [aStream nextPutAll: ' (as yet unbound)']
		ifFalse: [super printReferenceOn: aStream]