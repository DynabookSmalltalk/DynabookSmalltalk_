private
hashWithInitialHash: speciesHash
	"Answer the hash of a byte-indexed array, using speciesHash as the initial value.
	 See SmallInteger>>hashMultiply."
	<primitive: 'primitiveStringHash' module: 'MiscPrimitivePlugin'>

	^String stringHash: self initialHash: speciesHash