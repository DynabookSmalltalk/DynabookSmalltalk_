private
hashWithInitialHash: speciesHash
	"Answer the hash of a byte-indexed string, using speciesHash as the initial value.
	 See SmallInteger>>hashMultiply."
	| hash |
	hash := speciesHash bitAnd: 16r0FFFFFFF.
	1 to: self size do:
		[:pos |
		hash := (hash + (self basicAt: pos)) hashMultiply].
	^hash