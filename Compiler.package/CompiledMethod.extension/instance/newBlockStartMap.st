*Compiler-private
newBlockStartMap
	"If blocks are embedded then keys in the map are simple integer pcs and a Dictionary can be used.
	 If blocks are full (separate method objects) then keys in the map are CompiledBlocks and
	 IdentityDictionary must be used to avoid confusing blocks with identical code."
	^(self encoderClass supportsFullBlocks
		ifTrue: [IdentityDictionary]
		ifFalse: [Dictionary]) new