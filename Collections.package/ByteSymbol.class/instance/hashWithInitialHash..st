private
hashWithInitialHash: speciesHash
	"Answer the hash of a byte-indexed string, using speciesHash as the initial value.
	 See SmallInteger>>hashMultiply."
	<primitive: 'primitiveStringHash' module: 'MiscPrimitivePlugin'>

	^super hashWithInitialHash: speciesHash