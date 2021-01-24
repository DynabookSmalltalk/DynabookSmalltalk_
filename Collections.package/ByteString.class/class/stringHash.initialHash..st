primitives
stringHash: aString initialHash: speciesHash
	"Answer the hash of a byte-indexed string, using speciesHash as the initial value.
	 See SmallInteger>>hashMultiply."
	<primitive: 'primitiveStringHash' module: 'MiscPrimitivePlugin'>
	
	^super stringHash: aString initialHash: speciesHash