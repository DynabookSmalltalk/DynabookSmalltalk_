memory space
setGCBiasToGrow: aNumber
	"Primitive. Indicate that the GC logic should be bias to grow"
	<primitive: 'primitiveSetGCBiasToGrow'>
	^self primitiveFailed
"Example:
	Smalltalk setGCBiasToGrowGCLimit: 16*1024*1024.
	Smalltalk setGCBiasToGrow: 1.
"